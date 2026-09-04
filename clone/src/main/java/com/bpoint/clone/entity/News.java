package com.bpoint.clone.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "news")
@Getter
@Setter
public class News {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private String category; // "class" / "event" / "story"

        @Column(nullable = false)
        private String title;

        @Column
        private String excerpt; // 카드의 요약

        @Column(columnDefinition = "TEXT")
        private String content; // 상세 페이지 본문

        @Column(name = "post_date")
        private LocalDate postDate;

        @Column(name = "created_at")
        private LocalDateTime createdAt;
}
