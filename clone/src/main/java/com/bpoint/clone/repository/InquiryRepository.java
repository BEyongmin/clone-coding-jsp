package com.bpoint.clone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpoint.clone.entity.Inquiry;

public interface InquiryRepository extends JpaRepository<Inquiry, Long> {

    List<Inquiry> findAllByOrderByCreatedAtDesc();
}