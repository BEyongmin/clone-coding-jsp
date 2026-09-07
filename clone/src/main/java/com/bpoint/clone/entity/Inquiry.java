package com.bpoint.clone.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "inquiries")
@Getter
@Setter
public class Inquiry {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false)
        private String name;

        @Column(nullable = false)
        private String contact; // 연락처 / 이메일

        @Column(nullable = false)
        private String type; // 협력 / 단체 수업 요청 / 질문 / 기타

        @Column(name = "schedule")
        private String schedule; // 희망 인원/일정 (선택)

        @Column(columnDefinition = "TEXT", nullable = false)
        private String message;

        @Column(nullable = false)
        private String status = "pending";

        @Column(columnDefinition = "TEXT")
        private String reply;

        @Column(name = "replied_at")
        private LocalDateTime repliedAt;

        @Column(name = "created_at")
        private LocalDateTime createdAt;

        private static final DateTimeFormatter DATE_PART =
                DateTimeFormatter.ofPattern("yyyy. MM. dd.", Locale.KOREAN);
        private static final DateTimeFormatter TIME_PART =
                DateTimeFormatter.ofPattern("a h:mm", Locale.KOREAN);

        public String getCreatedAtDisplay() {
        if (createdAt == null) return "";
        return createdAt.format(DATE_PART) + "<br/>" + createdAt.format(TIME_PART);
        }
}
