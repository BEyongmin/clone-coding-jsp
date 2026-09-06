package com.bpoint.clone.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpoint.clone.entity.News;

public interface NewsRepository extends JpaRepository<News, Long> {

    List<News> findAllByOrderByPostDateDesc();

    long countByCategory(String category);

    Optional<News> findTopByIdLessThanOrderByIdDesc(Long id);

    Optional<News> findTopByIdGreaterThanOrderByIdAsc(Long id);

    List<News> findByShowInEventTrueOrderByPostDateDesc();
}
