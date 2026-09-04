<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="fwdPath" value="${requestScope['jakarta.servlet.forward.servlet_path']}" />
<c:set var="path" value="${empty fwdPath ? pageContext.request.servletPath : fwdPath}" />

<header class="nav">
  <div class="nav-inner">
    <a href="${pageContext.request.contextPath}/" class="brand">
      <img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="B.POINT" class="brand-logo" />
    </a>
    <button class="menu-toggle" id="menuToggle" aria-label="Menu">☰</button>
    <nav class="menu" id="menu">
      <a href="${pageContext.request.contextPath}/" class="${(path == '/' || path == '') ? 'active' : ''}">홈</a>
      <a href="${pageContext.request.contextPath}/about" class="${(path == '/about' || path == '/story') ? 'active' : ''}">소개</a>
      <a href="${pageContext.request.contextPath}/programs" class="${(path == '/programs' || path == '/class' || path == '/event') ? 'active' : ''}">프로그램</a>
      <a href="${pageContext.request.contextPath}/news" class="${fn:startsWith(path, '/news') ? 'active' : ''}">소식</a>
      <a href="${pageContext.request.contextPath}/notices" class="${fn:startsWith(path, '/notices') ? 'active' : ''}">공지</a>
      <a href="${pageContext.request.contextPath}/contact" class="${path == '/contact' ? 'active' : ''}">문의</a>
      <a class="cta" href="https://smartstore.naver.com" target="_blank" rel="noopener">클래스 신청 →</a>
    </nav>
  </div>
</header>