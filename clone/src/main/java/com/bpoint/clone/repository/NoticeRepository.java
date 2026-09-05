package com.bpoint.clone.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpoint.clone.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

    Optional<Notice> findFirstByIdLessThanOrderByIdDesc(Long id);

    Optional<Notice> findFirstByIdGreaterThanOrderByIdAsc(Long id);
    
    List<Notice> findAllByOrderByPostDateDesc();
}
