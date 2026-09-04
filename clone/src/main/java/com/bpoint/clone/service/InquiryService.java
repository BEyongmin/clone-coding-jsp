package com.bpoint.clone.service;

import java.time.LocalDateTime;

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
}
