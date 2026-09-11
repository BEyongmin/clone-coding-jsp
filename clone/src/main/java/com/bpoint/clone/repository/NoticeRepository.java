package com.bpoint.clone.repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.bpoint.clone.entity.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

    @Query(value = """
        SELECT * FROM notices n
        WHERE (n.post_date < :postDate)
           OR (n.post_date = :postDate AND n.created_at < :createdAt)
        ORDER BY n.post_date DESC, n.created_at DESC
        LIMIT 1
        """, nativeQuery = true)
    Optional<Notice> findPrevNotice(@Param("postDate") LocalDate postDate,
                                     @Param("createdAt") LocalDateTime createdAt);

    @Query(value = """
        SELECT * FROM notices n
        WHERE (n.post_date > :postDate)
           OR (n.post_date = :postDate AND n.created_at > :createdAt)
        ORDER BY n.post_date ASC, n.created_at ASC
        LIMIT 1
        """, nativeQuery = true)
    Optional<Notice> findNextNotice(@Param("postDate") LocalDate postDate,
                                     @Param("createdAt") LocalDateTime createdAt);

    List<Notice> findAllByOrderByPostDateDesc();

    @Modifying
    @Transactional 
    @Query("UPDATE Notice n SET n.viewCount = n.viewCount + 1 WHERE n.id = :id")
    void incrementViewCount(Long id);
}
