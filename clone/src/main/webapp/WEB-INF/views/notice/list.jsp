<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>공지 · 자료실 — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="page-hero">
  <div class="container">
    <div class="breadcrumb"><a href="${pageContext.request.contextPath}/">홈</a><span class="sep">/</span>공지 · 자료실</div>
    <span class="eyebrow">NOTICE &amp; RESOURCES</span>
    <h1>공지 · <span class="o">자료실</span></h1>
    <p class="lead">B.POINT의 클래스 모집, 협력 프로그램 안내, 멘탈 트레이닝·기본 가이드 등 다양한 자료.</p>
  </div>
</section>

<main class="page">
  <div class="container">
    <div class="notice-list">
      <c:forEach var="notice" items="${notices}">
        <div class="notice-item" onclick="location.href='${pageContext.request.contextPath}/notices/${notice.id}'">
          <span class="notice-badge ${notice.type == 'data' ? 'data' : ''}">
            ${notice.type == 'data' ? '자료' : '공지'}
          </span>
          <span class="notice-title">${notice.title}</span>
          <span class="notice-meta">${notice.postDate}</span>
          <span class="notice-file">${notice.type == 'data' ? 'PDF ↓' : '자세히 →'}</span>
        </div>
      </c:forEach>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>