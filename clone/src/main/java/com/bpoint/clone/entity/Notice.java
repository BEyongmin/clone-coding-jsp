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

    @Column(nullable = false)
    private String title;

    @Column
    private String content;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "view_count", nullable = false)
    private Integer viewCount = 0;

    @Column(name = "post_date")
    private LocalDate postDate;

    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
}
