package com.bpoint.clone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bpoint.clone.entity.News;
import com.bpoint.clone.service.NewsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor 
public class HomeController {

    private final NewsService newsService;

    @GetMapping("/")
    public String home(Model model) {
        List<News> recentNews = newsService.getAllNews().stream().limit(3).toList();
        model.addAttribute("recentNews", recentNews);
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/story")
    public String story() {
        return "story";
    }

    @GetMapping("/programs")
    public String programs() {
        return "programs";
    }

    @GetMapping("/class")
    public String classPage() {
        return "class";
    }

    @GetMapping("/event")
    public String event(Model model) {
        List<News> cases = newsService.getEventCases();
        model.addAttribute("cases", cases);
        return "event";
    }
}