<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${notice.title} — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="post-page">
  <div class="container">

    <div class="post-back">
      <a href="${pageContext.request.contextPath}/">홈</a> &nbsp;/&nbsp;
      <a href="${pageContext.request.contextPath}/notices">공지 · 자료실</a> &nbsp;/&nbsp;
      ${notice.type == 'data' ? '자료실' : '공지사항'}
    </div>

    <div class="post-header">
      <h1>
        <span class="tag">[${notice.type == 'data' ? '자료' : '공지'}]</span>${notice.title}
      </h1>
      <div class="post-meta">
        ${notice.postDate}
        <c:if test="${notice.type == 'notice'}"> · 조회 ${notice.viewCount}</c:if>
      </div>
    </div>

    <c:if test="${notice.type == 'data' && not empty notice.fileName}">
    <div class="post-attach">
      <div class="lbl">첨부파일</div>
      <div class="div"></div>
      <div>
        <a href="${pageContext.request.contextPath}/download/${notice.id}">(첨부) ${notice.fileName}</a>
        <span class="size">(${notice.fileSize})</span>
      </div>
    </div>
    </c:if>

    <div class="post-body">
    <p>${notice.content}</p>
    </div>

    <nav class="post-nav">
      <c:if test="${not empty prevNotice}">
        <a href="${pageContext.request.contextPath}/notices/${prevNotice.id}" class="row">
          <div class="dir">이전글</div>
          <div><span class="cat">[${prevNotice.type == 'data' ? '자료' : '공지'}]</span>${prevNotice.title}</div>
        </a>
      </c:if>
      <c:if test="${not empty nextNotice}">
        <a href="${pageContext.request.contextPath}/notices/${nextNotice.id}" class="row">
          <div class="dir">다음글</div>
          <div><span class="cat">[${nextNotice.type == 'data' ? '자료' : '공지'}]</span>${nextNotice.title}</div>
        </a>
      </c:if>
    </nav>

    <div class="post-actions">
      <a href="${pageContext.request.contextPath}/notices" class="btn btn-line">목록 →</a>
    </div>

  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>