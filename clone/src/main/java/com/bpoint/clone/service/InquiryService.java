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
}
