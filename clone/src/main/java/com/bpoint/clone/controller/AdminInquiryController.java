package com.bpoint.clone.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import com.bpoint.clone.entity.Inquiry;
import com.bpoint.clone.service.InquiryService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminInquiryController {

    private final InquiryService inquiryService;

    private static final String SESSION_KEY = "adminLoggedIn";

    @GetMapping("/admin/inquiries")
    public String page(HttpSession session) {
        if (!isAuthorized(session)) {
            return "redirect:/admin/login";
        }
        return "admin/inquiries";
    }

    @GetMapping("/admin/inquiries/api")
    @ResponseBody
    public List<Inquiry> list(HttpSession session) {
        checkAuthorized(session);
        return inquiryService.getAllForAdmin();
    }

    @PostMapping("/admin/inquiries/api/{id}/reply")
    @ResponseBody
    public Inquiry reply(@PathVariable("id") Long id, @RequestBody Map<String, String> body, HttpSession session) {
        checkAuthorized(session);
        return inquiryService.reply(id, body.get("reply"));
    }

    @DeleteMapping("/admin/inquiries/api/{id}")
    @ResponseBody
    public void delete(@PathVariable("id") Long id, HttpSession session) {
        checkAuthorized(session);
        inquiryService.delete(id);
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
