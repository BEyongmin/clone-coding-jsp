package com.bpoint.clone.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bpoint.clone.entity.News;
import com.bpoint.clone.service.NewsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NewsController {
    
    private final NewsService newsService;
    
        @GetMapping("/news")
        public String list(Model model) {
            List<News> newsList = newsService.getAllNews();

            model.addAttribute("newsList", newsList);
            model.addAttribute("allCount", newsService.countAll());
            model.addAttribute("classCount", newsService.countByCategory("class"));
            model.addAttribute("eventCount", newsService.countByCategory("event"));
            model.addAttribute("storyCount", newsService.countByCategory("story"));

            return "news";
        }

        @GetMapping("/news-detail/{id}")
        public String detail(@PathVariable Long id, Model model) {
            News news = newsService.getNewsById(id);

            List<String> paragraphs = Arrays.stream(news.getContent().split("\n"))
                .filter(line -> !line.trim().isEmpty())
                .toList();

            model.addAttribute("news", news);
            model.addAttribute("contentParagraphs", paragraphs); 
            model.addAttribute("prevNews", newsService.getPrevNews(id));
            model.addAttribute("nextNews", newsService.getNextNews(id));

            return "news-detail";
        }
}
