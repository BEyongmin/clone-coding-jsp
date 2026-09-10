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
        validateLength(req.getTitle());
        news.setCategory(req.getCategory());
        news.setTitle(req.getTitle());
        news.setExcerpt(req.getExcerpt());
        news.setContent(req.getContent());
        news.setAuthor(req.getAuthor() == null || req.getAuthor().isBlank() ? "B.POINT" : req.getAuthor());
        news.setImage(validateImageUrl(req.getImage()));
        news.setShowInEvent(Boolean.TRUE.equals(req.getShowInEvent()));
        news.setPostDate(parseDate(req.getDate()));
    }

    private String validateImageUrl(String imageUrl) {
        if (imageUrl == null || imageUrl.isBlank()) {
            return null;
        }
        if (!imageUrl.matches("^https?://\\S+\\.(jpg|jpeg|png|gif|webp)(\\?.*)?$")) {
            throw new IllegalArgumentException("대표 이미지 URL은 http(s):// 로 시작하는 이미지 주소(jpg, png, gif, webp)여야 합니다.");
        }
        return imageUrl;
    }

    private LocalDate parseDate(String date) {
        if (date == null || date.isBlank()) {
            return LocalDate.now();
        }
        return LocalDate.parse(date);
    }

    public List<News> getEventCases() {
        return newsRepository.findByShowInEventTrueOrderByPostDateDesc();
    }

        private void validateLength(String title) {
        if (title != null && title.length() > 100) {
            throw new IllegalArgumentException("제목은 최대 100자까지 입력 가능합니다. (현재 " + title.length() + "자)");
        }
    }
}
