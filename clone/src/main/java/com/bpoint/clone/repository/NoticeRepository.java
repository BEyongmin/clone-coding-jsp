package com.bpoint.clone.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.bpoint.clone.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

    Optional<Notice> findFirstByIdLessThanOrderByIdDesc(Long id);

    Optional<Notice> findFirstByIdGreaterThanOrderByIdAsc(Long id);
    
    List<Notice> findAllByOrderByPostDateDesc();

    @Modifying
    @Transactional 
    @Query("UPDATE Notice n SET n.viewCount = n.viewCount + 1 WHERE n.id = :id")
    void incrementViewCount(Long id);
}
