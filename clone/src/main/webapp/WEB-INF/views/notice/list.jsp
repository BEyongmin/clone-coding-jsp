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

    <!-- 탭 -->
    <div class="tabs">
      <a href="${pageContext.request.contextPath}/notices?type=all&sort=${sort}"
         class="tab ${type == 'all' ? 'active' : ''}">전체 <span class="count">${allCount}</span></a>
      <a href="${pageContext.request.contextPath}/notices?type=notice&sort=${sort}"
         class="tab ${type == 'notice' ? 'active' : ''}">공지사항 <span class="count">${noticeCount}</span></a>
      <a href="${pageContext.request.contextPath}/notices?type=data&sort=${sort}"
         class="tab ${type == 'data' ? 'active' : ''}">자료실 <span class="count">${dataCount}</span></a>
    </div>

    <!-- 검색 + 정렬 -->
    <form class="toolbar" method="get" action="${pageContext.request.contextPath}/notices">
      <input type="hidden" name="type" value="${type}" />
      <div class="search">
        <input type="text" name="keyword" value="${keyword}" placeholder="제목으로 검색하기" />
      </div>
      <select name="sort" class="sort" onchange="this.form.submit()">
        <option value="new" ${sort == 'new' ? 'selected' : ''}>최신순</option>
        <option value="old" ${sort == 'old' ? 'selected' : ''}>오래된순</option>
      </select>
      <button type="submit" style="display:none"></button>
    </form>

    <!-- 목록 -->
    <div class="notice-list">
      <c:forEach var="notice" items="${notices}" varStatus="status">
        <div class="notice-item" onclick="location.href='${pageContext.request.contextPath}/notices/${notice.id}'">
        <span class="notice-badge ${notice.type == 'data' ? 'data' : (status.first && sort == 'new' ? 'new' : '')}">
          <c:choose>
            <c:when test="${notice.type == 'data'}">자료</c:when>
            <c:when test="${status.first && sort == 'new'}">NEW</c:when>
            <c:otherwise>공지</c:otherwise>
          </c:choose>
        </span>
          <span class="notice-title">${notice.title}</span>
          <span class="notice-meta">${notice.postDate}
            <c:choose>
              <c:when test="${notice.type == 'notice'}"> · 조회 ${notice.viewCount}</c:when>
              <c:when test="${notice.type == 'data'}"> · ${notice.fileSize}</c:when>
            </c:choose>
        </span>
          <span class="notice-file">${notice.type == 'data' ? 'PDF ↓' : '자세히 →'}</span>
        </div>
      </c:forEach>
      <c:if test="${empty notices}">
        <div style="padding:40px 26px;text-align:center;color:var(--gray-400)">검색 결과가 없습니다.</div>
      </c:if>
    </div>

    <div class="pagination">
      <button>‹</button>
      <button class="active">1</button>
      <button>›</button>
    </div>

  </div>
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>