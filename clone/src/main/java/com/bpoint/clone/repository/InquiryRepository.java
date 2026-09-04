package com.bpoint.clone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpoint.clone.entity.Inquiry;

public interface InquiryRepository extends JpaRepository<Inquiry, Long> {
}