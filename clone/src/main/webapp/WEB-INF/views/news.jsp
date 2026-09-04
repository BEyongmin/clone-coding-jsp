<%@ page contentType="text/html; charset=UTF-8" %>
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
      <button class="filter active" data-filter="all">전체 <span class="count">6</span></button>
      <button class="filter" data-filter="class">CLASS <span class="count">2</span></button>
      <button class="filter" data-filter="event">EVENT <span class="count">2</span></button>
      <button class="filter" data-filter="story">STORY <span class="count">2</span></button>
    </div>
    <div class="grid">
      <article class="ncard" data-cat="class" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg a"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">CLASS</span><h4>첫 클래스를 마치며 — 작은 떨림이 만든 큰 변화</h4><p>슈팅 자세보다 호흡과 시선을 먼저 가르친 첫 주차.</p><div class="nmeta">2026.05.08</div></div></article>
      <article class="ncard" data-cat="event" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg b"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">EVENT</span><h4>모두가 주인공이 되는 농구 이벤트 'POINT DAY' 개최</h4><p>승패가 아닌 '오늘의 나의 성장'을 기록하는 새로운 페스티벌.</p><div class="nmeta">2026.04.22</div></div></article>
      <article class="ncard" data-cat="story" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg c"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">STORY</span><h4>왜 사격 출신 코치가 농구를 가르치는가</h4><p>0.1mm의 오차와 골밑의 1초.</p><div class="nmeta">2026.04.05</div></div></article>
      <article class="ncard" data-cat="class" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg d"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">CLASS</span><h4>새벽반을 시작합니다 — 출근 전 30분의 변화</h4><p>아침 6시 30분, 가장 조용한 코트.</p><div class="nmeta">2026.03.28</div></div></article>
      <article class="ncard" data-cat="event" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg e"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">EVENT</span><h4>○○스타트업 팀빌딩 이벤트 후기</h4><p>전사 30명, 농구 게임과 회복탄력성 워크숍을 결합한 팀빌딩.</p><div class="nmeta">2026.03.18</div></div></article>
      <article class="ncard" data-cat="story" onclick="location.href='${pageContext.request.contextPath}/news-detail'"><div class="nimg f"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div><div class="nbody"><span class="ntag">STORY</span><h4>'다시 일어서는 마음'을 가르치는 법</h4><p>실책 직후의 1초. B.POINT 코칭이 가장 집중하는 순간.</p><div class="nmeta">2026.02.20</div></div></article>
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