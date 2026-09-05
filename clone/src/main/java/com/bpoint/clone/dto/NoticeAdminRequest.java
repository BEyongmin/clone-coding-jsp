package com.bpoint.clone.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeAdminRequest {
    
    private String type;
    private String title;
    private String date;
    private String content;
    private String fileName;
    private String fileSize;
    private Boolean removeFile;
}
