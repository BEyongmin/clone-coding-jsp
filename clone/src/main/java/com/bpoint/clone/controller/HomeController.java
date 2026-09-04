package com.bpoint.clone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
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

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/event")
    public String event() {
        return "event";
    }

    // @GetMapping("/news")
    // public String news() {
    //     return "news";
    // }

    // @GetMapping("/news-detail")
    // public String newsDetail() {
    //     return "news-detail";
    // }
}