<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header class="nav">
  <div class="nav-inner">
    <a href="${pageContext.request.contextPath}/" class="brand">
      <img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="B.POINT" class="brand-logo" />
    </a>
    <button class="menu-toggle" id="menuToggle" aria-label="Menu">☰</button>
    <nav class="menu" id="menu">
      <a href="${pageContext.request.contextPath}/">홈</a>
      <a href="${pageContext.request.contextPath}/about">소개</a>
      <a href="${pageContext.request.contextPath}/programs">프로그램</a>
      <a href="${pageContext.request.contextPath}/news">소식</a>
      <a href="${pageContext.request.contextPath}/notices">공지</a>
      <a href="${pageContext.request.contextPath}/contact">문의</a>
      <a class="cta" href="https://smartstore.naver.com" target="_blank" rel="noopener">클래스 신청 →</a>
    </nav>
  </div>
</header>