<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Class — B.POINT</title>
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
      <a href="${pageContext.request.contextPath}/programs">프로그램</a><span class="sep">/</span>Class
    </div>
    <span class="eyebrow">CLASS</span>
    <h1>나를 마주하고,<br>어제보다 <span class="o">단단해지는</span> 시간.</h1>
    <p class="lead">개인과 소그룹을 위한 정기 농구 클래스. 사격 선수의 정밀한 감각과 멘탈 코칭을 결합한 B.POINT만의 커리큘럼.</p>
    <div style="margin-top:36px;display:flex;gap:12px;flex-wrap:wrap">
      <a class="btn btn-primary" href="https://smartstore.naver.com" target="_blank" rel="noopener">스마트스토어에서 신청 →</a>
      <a class="btn btn-ghost" href="${pageContext.request.contextPath}/contact">단체 수업 문의</a>
    </div>
  </div>
</section>

<section class="curri">
  <div class="container">
    <span class="eyebrow">CURRICULUM</span>
    <h2 class="section-title">한 클래스, <span class="o">4단계</span>의 흐름.</h2>
    <p class="section-sub">매 클래스는 같은 4단계 흐름으로 진행됩니다.</p>
    <div class="curri-grid">
      <div class="step"><div class="num">STEP 01</div><h4>호흡 · 워밍업</h4><p>사격 선수의 호흡법을 적용한 워밍업으로 시작.</p></div>
      <div class="step"><div class="num">STEP 02</div><h4>기본기 다지기</h4><p>드리블·슛·패스의 핵심 기본기를 자세 교정 위주로.</p></div>
      <div class="step"><div class="num">STEP 03</div><h4>몰입 훈련</h4><p>실패 상황 직후의 회복탄력성, 압박 상황에서의 평정심.</p></div>
      <div class="step"><div class="num">STEP 04</div><h4>피드백 · 기록</h4><p>점수가 아닌 '오늘 발견한 작은 도약'을 함께 기록.</p></div>
    </div>
  </div>
</section>

<section class="formats">
  <div class="container">
    <span class="eyebrow">FORMATS</span>
    <h2 class="section-title">상황에 맞는<br><span class="o">두 가지 형태.</span></h2>
    <div class="formats-grid">
      <div class="fmt"><span class="tag">PERSONAL</span><h3>개인 클래스</h3><p class="sub">코치와 1:1 또는 1:2로 진행하는 집중 클래스.</p>
        <ul><li>회당 60~75분</li><li>코치 1명 + 수강생 1~2명</li><li>맞춤 커리큘럼 · 영상 피드백</li><li>주 1회 권장 / 4주 단위 신청</li></ul>
      </div>
      <div class="fmt"><span class="tag">GROUP</span><h3>그룹 클래스</h3><p class="sub">3~6명이 함께 하는 소그룹 클래스.</p>
        <ul><li>회당 90분</li><li>코치 1~2명 + 수강생 3~6명</li><li>주제별 모듈 · 미니 게임 포함</li><li>주 1회 / 8주 시즌제 운영</li></ul>
      </div>
    </div>
  </div>
</section>

<section class="pricing">
  <div class="container">
    <span class="eyebrow">PRICING</span>
    <h2 class="section-title" style="color:#fff">합리적인 <span class="o">시즌 패키지.</span></h2>
    <p class="section-sub">정확한 가격은 스마트스토어에서 확인 가능합니다.</p>
    <div class="pricing-grid">
      <div class="plan"><div class="ptag">TRIAL</div><h3>1회 체험</h3><div class="price">상담 가능 <small>/ 1회</small></div>
        <ul><li>개인 클래스 1회</li><li>맞춤 피드백 리포트</li><li>현 수준 진단 포함</li></ul>
        <a class="btn btn-primary" href="https://smartstore.naver.com" target="_blank" rel="noopener">체험 신청 →</a>
      </div>
      <div class="plan featured"><div class="ptag">★ 추천</div><h3>월 정기 (4회)</h3><div class="price">상담 가능 <small>/ 4회 · 1개월</small></div>
        <ul><li>주 1회 정기 클래스</li><li>월 1회 멘탈 코칭 세션</li><li>매주 영상 피드백</li><li>전용 성장 로그 제공</li></ul>
        <a class="btn btn-dark" href="https://smartstore.naver.com" target="_blank" rel="noopener">정기권 신청 →</a>
      </div>
      <div class="plan"><div class="ptag">SEASON</div><h3>시즌 패키지 (8주)</h3><div class="price">상담 가능 <small>/ 8회 · 2개월</small></div>
        <ul><li>그룹 클래스 8회</li><li>시즌 종료 리뷰 세션</li><li>커뮤니티 이벤트 우선 참여</li></ul>
        <a class="btn btn-primary" href="https://smartstore.naver.com" target="_blank" rel="noopener">시즌제 신청 →</a>
      </div>
    </div>
  </div>
</section>

<section class="faq">
  <div class="container">
    <span class="eyebrow">FAQ</span>
    <h2 class="section-title">자주 묻는 질문.</h2>
    <div class="faq-list">
      <div class="faq-item"><div class="faq-q">처음 농구를 배우는 사람도 참여할 수 있나요?<span class="plus">+</span></div><div class="faq-a">네, 가능합니다. B.POINT 클래스는 '기술 수준'이 아닌 '성장 의지'를 기준으로 합니다.</div></div>
      <div class="faq-item"><div class="faq-q">멘탈 코칭은 어떤 방식으로 이루어지나요?<span class="plus">+</span></div><div class="faq-a">기술 훈련 중 자연스럽게 호흡과 시선, 자세를 통한 평정심 훈련을 진행합니다.</div></div>
      <div class="faq-item"><div class="faq-q">결석 시 보강이 가능한가요?<span class="plus">+</span></div><div class="faq-a">사전 안내 시 같은 월 내 보강 1회까지 가능합니다.</div></div>
      <div class="faq-item"><div class="faq-q">단체 수업이나 기업 출장 클래스도 가능한가요?<span class="plus">+</span></div><div class="faq-a">가능합니다. 학교·기업·단체용 맞춤 프로그램은 별도 협의로 진행됩니다.</div></div>
      <div class="faq-item"><div class="faq-q">장비나 복장은 어떻게 준비하면 되나요?<span class="plus">+</span></div><div class="faq-a">편안한 운동복과 실내용 운동화면 충분합니다. 농구공은 클래스에서 제공됩니다.</div></div>
    </div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>document.querySelectorAll('.faq-item').forEach(item => item.addEventListener('click', () => item.classList.toggle('open')));</script>
</body>
</html>