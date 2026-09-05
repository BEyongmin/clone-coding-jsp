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

import com.bpoint.clone.dto.NewsAdminRequest;
import com.bpoint.clone.entity.News;
import com.bpoint.clone.service.NewsService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminNewsController {

    private final NewsService newsService;

    private static final String SESSION_KEY = "adminLoggedIn";

    @GetMapping("/admin/news")
    public String page(HttpSession session) {
        if (!isAuthorized(session)) {
            return "redirect:/admin/login";
        }
        return "admin/news";
    }

    @GetMapping("/admin/news/api")
    @ResponseBody
    public List<News> list(HttpSession session) {
        checkAuthorized(session);
        return newsService.getAllForAdmin();
    }

    @PostMapping("/admin/news/api")
    @ResponseBody
    public News create(@RequestBody NewsAdminRequest request, HttpSession session) {
        checkAuthorized(session);
        return newsService.create(request);
    }

    @PutMapping("/admin/news/api/{id}")
    @ResponseBody
    public News update(@PathVariable("id") Long id, @RequestBody NewsAdminRequest request, HttpSession session) {
        checkAuthorized(session);
        return newsService.update(id, request);
    }

    @DeleteMapping("/admin/news/api/{id}")
    @ResponseBody
    public void delete(@PathVariable("id") Long id, HttpSession session) {
        checkAuthorized(session);
        newsService.delete(id);
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
