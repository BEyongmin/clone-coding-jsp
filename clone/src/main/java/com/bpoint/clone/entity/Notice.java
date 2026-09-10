package com.bpoint.clone.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "notices")
@Getter
@Setter
public class Notice {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String type;

    @Column(nullable = false, length = 100)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String content;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "file_size")
    private String fileSize;

    @Column(name = "view_count", nullable = false)
    private Integer viewCount = 0;

    @Column(name = "post_date")
    private LocalDate postDate;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    public boolean isRecent() {
    return postDate != null && postDate.isEqual(LocalDate.now());
    }
}
