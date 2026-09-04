<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>소식 — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="page-hero">
  <div class="container">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/">홈</a><span class="sep">/</span>소식
    </div>
    <span class="eyebrow">NEWS &amp; STORIES</span>
    <h1>B.POINT의 <span class="o">움직임.</span></h1>
    <p class="lead">클래스 현장, 이벤트 후기, 그리고 우리가 만들어가는 변화의 기록들.</p>
  </div>
</section>

<section class="news-section">
  <div class="container">
    <div class="filters" id="filters">
      <button class="filter active" data-filter="all">전체 <span class="count">${allCount}</span></button>
      <button class="filter" data-filter="class">CLASS <span class="count">${classCount}</span></button>
      <button class="filter" data-filter="event">EVENT <span class="count">${eventCount}</span></button>
      <button class="filter" data-filter="story">STORY <span class="count">${storyCount}</span></button>
    </div>
    <div class="grid">
      <c:set var="colors" value="${fn:split('a,b,c,d,e,f', ',')}" />
      <c:forEach var="news" items="${newsList}" varStatus="status">
        <article class="ncard" data-cat="${news.category}"
                  onclick="location.href='${pageContext.request.contextPath}/news-detail/${news.id}'">
          <div class="nimg ${colors[status.index % 6]}">
            <img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="">
          </div>
          <div class="nbody">
            <span class="ntag">${fn:toUpperCase(news.category)}</span>
            <h4>${news.title}</h4>
            <p>${news.excerpt}</p>
            <div class="nmeta">${news.postDate}</div>
          </div>
        </article>
      </c:forEach>
      <c:if test="${empty newsList}">
        <div style="padding:60px 0;text-align:center;color:var(--gray-400)">등록된 소식이 없습니다.</div>
      </c:if>
    </div>
    <div class="pagination"><button>‹</button><button class="active">1</button><button>›</button></div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
  const filters = document.querySelectorAll('.filter');
  const cards = document.querySelectorAll('.ncard');
  filters.forEach(f => f.addEventListener('click', () => {
    filters.forEach(x => x.classList.remove('active'));
    f.classList.add('active');
    const cat = f.dataset.filter;
    cards.forEach(c => c.style.display = (cat === 'all' || c.dataset.cat === cat) ? '' : 'none');
  }));
</script>
</body>
</html>