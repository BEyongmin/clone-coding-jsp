package com.bpoint.clone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bpoint.clone.entity.News;
import com.bpoint.clone.repository.NewsRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NewsService {
    
    private final NewsRepository newsRepository;

    public List<News> getAllNews() {
        return newsRepository.findAllByOrderByPostDateDesc();
    }

    public long countAll() {
        return newsRepository.count();
    }

    public long countByCategory(String category) {
        return newsRepository.countByCategory(category);
    }

    public News getNewsById(Long id) {
        return newsRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 소식입니다. id=" + id));
    }

    public News getPrevNews(Long id) {
        return newsRepository.findTopByIdLessThanOrderByIdDesc(id).orElse(null);
    }

    public News getNextNews(Long id) {
        return newsRepository.findTopByIdGreaterThanOrderByIdAsc(id).orElse(null);
    }
}
