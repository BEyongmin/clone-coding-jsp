package com.bpoint.clone.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bpoint.clone.dto.NewsAdminRequest;
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

    // 관리자용

    public List<News> getAllForAdmin() {
        return newsRepository.findAllByOrderByPostDateDesc();
    }

    public News create(NewsAdminRequest req) {
        News news = new News();
        applyRequest(news, req);
        news.setCreatedAt(LocalDateTime.now());
        return newsRepository.save(news);
    }

    public News update(Long id, NewsAdminRequest req) {
        News news = getNewsById(id);
        applyRequest(news, req);
        return newsRepository.save(news);
    }

    public void delete(Long id) {
        newsRepository.deleteById(id);
    }

    private void applyRequest(News news, NewsAdminRequest req) {
        news.setCategory(req.getCategory());
        news.setTitle(req.getTitle());
        news.setExcerpt(req.getExcerpt());
        news.setContent(req.getContent());
        news.setAuthor(req.getAuthor() == null || req.getAuthor().isBlank() ? "B.POINT" : req.getAuthor());
        news.setImage(req.getImage());
        news.setShowInEvent(Boolean.TRUE.equals(req.getShowInEvent()));
        news.setPostDate(parseDate(req.getDate()));
    }

    private LocalDate parseDate(String date) {
        if (date == null || date.isBlank()) {
            return LocalDate.now();
        }
        return LocalDate.parse(date);
    }
}
