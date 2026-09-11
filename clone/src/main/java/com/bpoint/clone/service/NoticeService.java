package com.bpoint.clone.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bpoint.clone.dto.NoticeAdminRequest;
import com.bpoint.clone.entity.Notice;
import com.bpoint.clone.repository.NoticeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeRepository noticeRepository;

    @Value("${app.upload-dir:/app/uploads/}")
    private String uploadDir;

    public List<Notice> getAllNotices() {
        return noticeRepository.findAll();
    }

    public Notice getNoticeById(Long id) {
        return noticeRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 공지사항이 없습니다. id=" + id));
    }

    public List<Notice> searchNotices(String type, String keyword, String sort) {
        List<Notice> all = noticeRepository.findAll();

        List<Notice> filtered = all.stream()
                .filter(n -> type.equals("all") || n.getType().equals(type))
                .filter(n -> keyword.isBlank() || n.getTitle().contains(keyword))
                .collect(Collectors.toList());

        if (sort.equals("old")) {
            filtered.sort(Comparator.comparing(Notice::getPostDate)
                    .thenComparing(Notice::getCreatedAt));
        } else {
            filtered.sort(Comparator.comparing(Notice::getPostDate)
                    .thenComparing(Notice::getCreatedAt)
                    .reversed());
        }

        return filtered;
    }

    public long countByType(String type) {
        List<Notice> all = noticeRepository.findAll();
        if (type.equals("all")) {
            return all.size();
        }
        return all.stream().filter(n -> n.getType().equals(type)).count();
    }

    public Notice getPrevNotice(Long id) {
        Notice current = getNoticeById(id);   // 먼저 현재 글 조회
        return noticeRepository.findPrevNotice(current.getPostDate(), current.getCreatedAt())
                .orElse(null);
    }

    public Notice getNextNotice(Long id) {
        Notice current = getNoticeById(id);   // 먼저 현재 글 조회
        return noticeRepository.findNextNotice(current.getPostDate(), current.getCreatedAt())
                .orElse(null);
    }

    // 관리자용

    public List<Notice> getAllForAdmin() {
        return noticeRepository.findAllByOrderByPostDateDesc();
    }

    public Notice create(NoticeAdminRequest req) {
        Notice notice = new Notice();
        applyCommonFields(notice, req);
        notice.setFileName(req.getFileName());
        notice.setFileSize(req.getFileSize());
        notice.setViewCount(0);
        notice.setCreatedAt(LocalDateTime.now());
        return noticeRepository.save(notice);
    }

    public Notice update(Long id, NoticeAdminRequest req) {
        Notice notice = getNoticeById(id);
        applyCommonFields(notice, req);

        boolean newFileUploaded = req.getFileName() != null;
        boolean removeRequested = Boolean.TRUE.equals(req.getRemoveFile());

        if (newFileUploaded) {
            // 새 파일이 왔으면, 기존 파일은 지우고 새 파일로 교체
            deleteFile(notice.getFileName());
            notice.setFileName(req.getFileName());
            notice.setFileSize(req.getFileSize());
        } else if (removeRequested) {
            // 새 파일 없이 "제거"만 요청했으면, 기존 파일 지우고 비움
            deleteFile(notice.getFileName());
            notice.setFileName(null);
            notice.setFileSize(null);
        }
        // 둘 다 아니면 기존 파일 정보를 그대로 둔다 (아무것도 안 건드림)

        return noticeRepository.save(notice);
    }

    public void delete(Long id) {
        Notice notice = getNoticeById(id);
        deleteFile(notice.getFileName());
        noticeRepository.deleteById(id);
    }

    public String saveFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return null;
        }
        String originalFilename = file.getOriginalFilename();
        validateExtension(originalFilename); 
        String storedFilename = System.currentTimeMillis() + "_" + originalFilename;
        try {
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            Path targetPath = uploadPath.resolve(storedFilename);
            Files.copy(file.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new RuntimeException("파일 저장에 실패했습니다.", e);
        }
        return storedFilename;
    }

    public Path getFilePath(String fileName) {
    return Paths.get(uploadDir).resolve(fileName);
    }

    public String formatFileSize(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format("%.1f KB", bytes / 1024.0);
        return String.format("%.1f MB", bytes / (1024.0 * 1024.0));
    }

    private void deleteFile(String fileName) {
        if (fileName == null || fileName.isBlank()) {
            return;
        }
        try {
            Path target = Paths.get(uploadDir).resolve(fileName);
            Files.deleteIfExists(target);
        } catch (IOException e) {
            // 파일 삭제 실패는 전체 작업을 막을 만큼 치명적이지 않으므로 로그만 남기고 넘어감
            System.err.println("첨부파일 삭제 실패: " + fileName);
        }
    }

    private void applyCommonFields(Notice notice, NoticeAdminRequest req) {
        validateLength(req.getTitle());
        notice.setType(req.getType());
        notice.setTitle(req.getTitle());
        notice.setContent(req.getContent());
        notice.setPostDate(parseDate(req.getDate()));
    }

    private LocalDate parseDate(String date) {
        if (date == null || date.isBlank()) {
            return LocalDate.now();
        }
        return LocalDate.parse(date);
    }

    private void validateExtension(String filename) {
        if (filename == null || !filename.contains(".")) {
            throw new IllegalArgumentException("파일 확장자를 확인할 수 없습니다.");
        }

        String extension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
        List<String> allowedExtensions = List.of("jpg", "jpeg", "png", "gif", "webp");

        if (!allowedExtensions.contains(extension)) {
            throw new IllegalArgumentException("허용되지 않는 파일 형식입니다. (jpg, jpeg, png, gif, webp만 가능)");
        }
    }
    private void validateLength(String title) {
        if (title != null && title.length() > 100) {
            throw new IllegalArgumentException("제목은 최대 100자까지 입력 가능합니다. (현재 " + title.length() + "자)");
        }
    }

    public void increaseViewCount(Long id) {
        noticeRepository.incrementViewCount(id);
    }
}