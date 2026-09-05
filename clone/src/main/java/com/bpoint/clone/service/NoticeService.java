package com.bpoint.clone.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.bpoint.clone.dto.NoticeAdminRequest;
import com.bpoint.clone.entity.Notice;
import com.bpoint.clone.repository.NoticeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeRepository noticeRepository;

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
            filtered.sort(Comparator.comparing(Notice::getPostDate));
        } else {
            filtered.sort(Comparator.comparing(Notice::getPostDate).reversed());
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
    return noticeRepository.findFirstByIdLessThanOrderByIdDesc(id).orElse(null);
    }

    public Notice getNextNotice(Long id) {
        return noticeRepository.findFirstByIdGreaterThanOrderByIdAsc(id).orElse(null);
    }

    // 관리자용

    public List<Notice> getAllForAdmin() {
        return noticeRepository.findAllByOrderByPostDateDesc();
    }

    public Notice create(NoticeAdminRequest req) {
        Notice notice = new Notice();
        applyRequest(notice, req);
        notice.setViewCount(0);
        notice.setCreatedAt(LocalDateTime.now());
        return noticeRepository.save(notice);
    }

    public Notice update(Long id, NoticeAdminRequest req) {
        Notice notice = getNoticeById(id);
        applyRequest(notice, req);
        return noticeRepository.save(notice);
    }

    public void delete(Long id) {
        noticeRepository.deleteById(id);
    }

    private void applyRequest(Notice notice, NoticeAdminRequest req) {
        notice.setType(req.getType());
        notice.setTitle(req.getTitle());
        notice.setContent(req.getContent());
        notice.setFileName(req.getFileName());
        notice.setFileSize(req.getFileSize());
        notice.setPostDate(parseDate(req.getDate()));
    }

    private LocalDate parseDate(String date) {
        if (date == null || date.isBlank()) {
            return LocalDate.now();
        }
        return LocalDate.parse(date);
    }
}