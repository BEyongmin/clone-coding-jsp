package com.bpoint.clone.service;

import java.util.List;

import org.springframework.stereotype.Service;

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
}
