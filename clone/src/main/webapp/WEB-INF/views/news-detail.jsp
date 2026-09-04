<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${news.title} — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="post-page news-post">
  <div class="container">
    <div class="post-back">
      <a href="${pageContext.request.contextPath}/">홈</a> &nbsp;/&nbsp;
      <a href="${pageContext.request.contextPath}/news">소식</a> &nbsp;/&nbsp; ${fn:toUpperCase(news.category)}
    </div>
    <div class="post-header">
      <h1><span class="tag">[${fn:toUpperCase(news.category)}]</span>${news.title}</h1>
      <div class="post-meta">${news.postDate}</div>
    </div>
    <div class="post-image"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div>
    <div class="post-body">
      <c:forEach var="para" items="${contentParagraphs}">
        <p>${para}</p>
      </c:forEach>
    </div>
    <nav class="post-nav">
      <c:if test="${not empty prevNews}">
        <div class="row">
          <div class="dir">이전글</div>
          <a href="${pageContext.request.contextPath}/news-detail/${prevNews.id}">
            <span class="cat">[${fn:toUpperCase(prevNews.category)}]</span>${prevNews.title}
          </a>
        </div>
      </c:if>
      <c:if test="${not empty nextNews}">
        <div class="row">
          <div class="dir">다음글</div>
          <a href="${pageContext.request.contextPath}/news-detail/${nextNews.id}">
            <span class="cat">[${fn:toUpperCase(nextNews.category)}]</span>${nextNews.title}
          </a>
        </div>
      </c:if>
    </nav>
    <div class="post-actions"><a class="btn btn-line" href="${pageContext.request.contextPath}/news">목록 →</a></div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>