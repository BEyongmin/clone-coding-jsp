<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>프로그램 — B.POINT</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="page-hero">
  <div class="container">
    <div class="breadcrumb">
      <a href="${pageContext.request.contextPath}/">홈</a><span class="sep">/</span>프로그램
    </div>
    <span class="eyebrow">PROGRAMS</span>
    <h1>승패를 넘어 우리를 잇는,<br><span class="o">함께 성장하는</span> 경험.</h1>
    <p class="lead">엘리트 사격 선수의 정밀한 감각과 멘탈 수련 노하우를 농구 교육에 접목했습니다.</p>
  </div>
</section>

<section class="programs-section">
  <div class="container">
    <div class="intro">
      <span class="eyebrow">TWO TRACKS</span>
      <h2 class="section-title">두 가지 트랙,<br><span class="o">하나의</span> 철학.</h2>
      <p>매주의 클래스(Class)는 '나를 마주하는 시간', 분기별 이벤트(Event)는 '함께 모이는 축제'입니다.</p>
    </div>
    <div class="program-grid">
      <div class="program class">
        <div>
          <span class="program-tag">CLASS</span>
          <h3>나를 마주하고,<br>어제보다 단단해지는 시간.</h3>
          <p class="ko">개인 · 그룹 농구 클래스</p>
          <ul>
            <li><strong>몰입의 기술 전수</strong>사격 선수의 호흡법·마인드 컨트롤 기법.</li>
            <li><strong>성장 중심 피드백</strong>점수가 아닌 수행 과정의 변화에 집중.</li>
            <li><strong>무의식 멘탈 코칭</strong>심리적 압박의 원인을 데이터로 찾기.</li>
          </ul>
        </div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/class" style="width:fit-content">Class 자세히 →</a>
      </div>
      <div class="program event">
        <div>
          <span class="program-tag" style="background:rgba(0,0,0,.18);color:#fff">EVENT</span>
          <h3>성취를 공유하고,<br>즐거움으로 하나 되는 축제.</h3>
          <p class="ko">대회 · 행사 · 커뮤니티</p>
          <ul>
            <li><strong>포용적 경쟁 시스템</strong>각자의 목표를 달성한 모두가 주인공.</li>
            <li><strong>통합의 장 마련</strong>실력 차이를 넘어 스포츠로 소통.</li>
            <li><strong>성장의 궤적 공유</strong>각자의 한계를 넓혀가는 과정 응원.</li>
          </ul>
        </div>
        <a class="btn btn-dark" href="${pageContext.request.contextPath}/event" style="width:fit-content">Event 자세히 →</a>
      </div>
    </div>
  </div>
</section>

<section class="compare">
  <div class="container">
    <span class="eyebrow" style="display:block;text-align:center">CLASS vs EVENT</span>
    <h2 class="section-title">한 눈에 비교하기.</h2>
    <p class="section-sub">어떤 트랙이 나에게 맞는지 가볍게 살펴보세요.</p>
    <table class="cmp">
      <thead><tr><th>구분</th><th>CLASS</th><th>EVENT</th></tr></thead>
      <tbody>
        <tr><th>목적</th><td>정기적인 자기 성장 / 멘탈 훈련</td><td>축제형 모임 · 단체 행사</td></tr>
        <tr><th>형태</th><td>개인 · 그룹 클래스 (주 1회 권장)</td><td>분기별 이벤트 · 기업/단체 맞춤</td></tr>
        <tr><th>인원</th><td>1~6명 소수 정예</td><td>10~100명+ 규모</td></tr>
        <tr><th>주안점</th><td>호흡 · 평정심 · 몰입 기술</td><td>참여 · 화합 · 성장 공유</td></tr>
        <tr><th>적합한 분</th><td>꾸준한 자기 성장을 원하는 분</td><td>팀빌딩 · 단체 활동을 찾는 분</td></tr>
        <tr><th>신청 방법</th><td class="orange">스마트스토어 즉시 결제</td><td class="orange">문의 후 일정 협의</td></tr>
      </tbody>
    </table>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>