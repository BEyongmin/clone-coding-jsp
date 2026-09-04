<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Event — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="page-hero">
  <div class="container">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/">홈</a><span class="sep">/</span>
      <a href="${pageContext.request.contextPath}/programs">프로그램</a><span class="sep">/</span>Event
    </div>
    <span class="eyebrow">EVENT</span>
    <h1>성취를 공유하고,<br>즐거움으로 <span class="o">하나 되는</span> 축제.</h1>
    <p class="lead">승패가 아닌, 각자의 목표를 달성한 모두가 주인공이 되는 농구 이벤트.</p>
    <div style="margin-top:36px;display:flex;gap:12px;flex-wrap:wrap">
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/contact">이벤트 문의하기 →</a>
      <a class="btn btn-ghost" href="${pageContext.request.contextPath}/news">진행 사례 보기</a>
    </div>
  </div>
</section>

<section class="concept">
  <div class="container">
    <div class="concept-grid">
      <div class="left">
        <span class="eyebrow">CONCEPT</span>
        <h2>모두가 <span class="o">주인공</span>이 되는<br>새로운 축제.</h2>
        <p>결과 중심의 순위 경쟁에서 탈피, 각자의 목표를 달성한 모두가 박수를 받는 '포용적 경쟁'의 자리.</p>
        <p>'이긴 사람'이 아니라 '오늘 가장 큰 변화를 만든 사람'이 박수를 받는, 그런 새로운 형식의 농구 페스티벌입니다.</p>
      </div>
      <div class="concept-img"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="B.POINT" /></div>
    </div>
  </div>
</section>

<section class="types">
  <div class="container">
    <span class="eyebrow">EVENT TYPES</span>
    <h2 class="section-title">세 가지 형태의<br><span class="o">이벤트.</span></h2>
    <p class="section-sub">참여 인원과 목적에 맞춰 유연하게 구성됩니다.</p>
    <div class="types-grid">
      <div class="etype"><div class="num">TYPE 01</div><h3>POINT DAY</h3><p>분기별 정기 페스티벌.</p><ul><li>분기 1회 · 약 4시간</li><li>30~100명 규모</li><li>실력별 트랙 + 미니 토너먼트</li></ul></div>
      <div class="etype"><div class="num">TYPE 02</div><h3>기업 단체 행사</h3><p>워크숍·팀빌딩용 맞춤 이벤트.</p><ul><li>3~6시간</li><li>20~80명 규모</li><li>맞춤 프로그램 설계</li></ul></div>
      <div class="etype"><div class="num">TYPE 03</div><h3>학교 · 단체</h3><p>학교·단체용 교육형 이벤트.</p><ul><li>2~4시간</li><li>10~40명 규모</li><li>지자체·기관 협약 가능</li></ul></div>
    </div>
  </div>
</section>

<section class="cases">
  <div class="container">
    <span class="eyebrow">CASES</span>
    <h2 class="section-title" style="color:#fff">함께한 <span class="o">사례들.</span></h2>
    <p class="section-sub">B.POINT가 진행한 이벤트의 일부 사례입니다.</p>
    <div class="case-grid">
      <div class="case"><span class="tag">POINT DAY</span><h4>2026 봄 — 첫 POINT DAY 개최</h4><p>실력별 4개 트랙. 참가자 64명, 18명이 모두 주인공이 된 첫 페스티벌.</p><div class="meta">2026.04.22 · 강남 ○○체육관</div></div>
      <div class="case"><span class="tag">CORPORATE</span><h4>○○스타트업 팀빌딩 이벤트</h4><p>전사 30명 워크숍. 농구 게임 + 회복탄력성 워크숍 + 회고 세션.</p><div class="meta">2026.03.18 · 사내 체육관</div></div>
      <div class="case"><span class="tag">SCHOOL</span><h4>○○고등학교 자기효능감 클래스</h4><p>3학년 24명. 농구와 결합한 4주 프로그램.</p><div class="meta">2026.02 ~ 2026.03</div></div>
      <div class="case"><span class="tag">PARTNER</span><h4>○○복지관 시니어 농구 클리닉</h4><p>60대 이상 어르신 12명. '다시 일어선 나'를 박수받는 시간.</p><div class="meta">2026.01.30</div></div>
    </div>
  </div>
</section>

<section class="event-cta">
  <div class="container">
    <div class="box">
      <div><h3>함께 만들고 싶은 <br>이벤트가 있다면?</h3><p>학교·기업·단체용 맞춤 프로그램은 별도 협의로 진행됩니다.</p></div>
      <div class="actions"><a class="btn btn-dark" href="${pageContext.request.contextPath}/contact">이벤트 문의하기 →</a></div>
    </div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>