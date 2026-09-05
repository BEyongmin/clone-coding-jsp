package com.bpoint.clone.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewsAdminRequest {
    private String category;
    private String title;
    private String excerpt;
    private String content;
    private String author;
    private String image;
    private String date;
    private Boolean showInEvent;
}
