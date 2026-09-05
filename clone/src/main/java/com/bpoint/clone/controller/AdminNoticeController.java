package com.bpoint.clone.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.bpoint.clone.dto.NoticeAdminRequest;
import com.bpoint.clone.entity.Notice;
import com.bpoint.clone.service.NoticeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminNoticeController {

    private final NoticeService noticeService;

    private static final String SESSION_KEY = "adminLoggedIn";

    
    @GetMapping("/admin/notices")
    public String page(HttpSession session) {
        if (!isAuthorized(session)) {
            return "redirect:/admin/login";
        }
        return "admin/notices";
    }

    @GetMapping("/admin/notices/api")
    @ResponseBody
    public List<Notice> list(HttpSession session) {
        checkAuthorized(session);
        return noticeService.getAllForAdmin();
    }

    @PostMapping("/admin/notices/api")
    @ResponseBody
    public Notice create(@RequestPart("data") NoticeAdminRequest request,
                        @RequestPart(value = "file", required = false) MultipartFile file,
                        HttpSession session) {
        checkAuthorized(session);
        applyFile(request, file);
        return noticeService.create(request);
    }


    @PutMapping("/admin/notices/api/{id}")
    @ResponseBody
    public Notice update(@PathVariable("id") Long id,
                        @RequestPart("data") NoticeAdminRequest request,
                        @RequestPart(value = "file", required = false) MultipartFile file,
                        HttpSession session) {
        checkAuthorized(session);
        applyFile(request, file);
        return noticeService.update(id, request);
    }

    @DeleteMapping("/admin/notices/api/{id}")
    @ResponseBody
    public void delete(@PathVariable("id") Long id, HttpSession session) {
        checkAuthorized(session);
        noticeService.delete(id);
    }

    private void applyFile(NoticeAdminRequest request, MultipartFile file) {
    if (file != null && !file.isEmpty()) {
        String savedFileName = noticeService.saveFile(file);
        request.setFileName(savedFileName);
        request.setFileSize(noticeService.formatFileSize(file.getSize()));
    }
    }

    private boolean isAuthorized(HttpSession session) {
        return Boolean.TRUE.equals(session.getAttribute(SESSION_KEY));
    }

    private void checkAuthorized(HttpSession session) {
        if (!isAuthorized(session)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "로그인이 필요합니다.");
        }
    }
}
