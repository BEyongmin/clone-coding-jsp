package com.bpoint.clone.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bpoint.clone.entity.Inquiry;
import com.bpoint.clone.repository.InquiryRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryService {
    
    private final InquiryRepository inquiryRepository;

    public void save(Inquiry inquiry) {
        inquiry.setCreatedAt(LocalDateTime.now());
        inquiryRepository.save(inquiry);
    }

    public long countAll() {
    return inquiryRepository.count();
    }

    public List<Inquiry> getRecent(int limit) {
        return inquiryRepository.findAllByOrderByCreatedAtDesc()
                .stream()
                .limit(limit)
                .toList();
    }

    // 관리자용
    public List<Inquiry> getAllForAdmin() {
        return inquiryRepository.findAllByOrderByCreatedAtDesc();
    }

    public Inquiry getById(Long id) {
        return inquiryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 문의입니다. id=" + id));
    }

    public void delete(Long id) {
        inquiryRepository.deleteById(id);
    }

    public Inquiry reply(Long id, String replyContent) {
    Inquiry inquiry = getById(id);
    inquiry.setReply(replyContent);
    inquiry.setRepliedAt(LocalDateTime.now());
    inquiry.setStatus("done");
    return inquiryRepository.save(inquiry);
}
}
