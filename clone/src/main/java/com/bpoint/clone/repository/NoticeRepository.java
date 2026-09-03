package com.bpoint.clone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpoint.clone.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {
    
}
