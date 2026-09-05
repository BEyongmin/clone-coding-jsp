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
import org.springframework.web.bind.annotation.ResponseBody;
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
    public Notice create(@RequestBody NoticeAdminRequest request, HttpSession session) {
        checkAuthorized(session);
        return noticeService.create(request);
    }

    @PutMapping("/admin/notices/api/{id}")
    @ResponseBody
    public Notice update(@PathVariable("id") Long id, @RequestBody NoticeAdminRequest request, HttpSession session) {
        checkAuthorized(session);
        return noticeService.update(id, request);
    }

    @DeleteMapping("/admin/notices/api/{id}")
    @ResponseBody
    public void delete(@PathVariable("id") Long id, HttpSession session) {
        checkAuthorized(session);
        noticeService.delete(id);
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
