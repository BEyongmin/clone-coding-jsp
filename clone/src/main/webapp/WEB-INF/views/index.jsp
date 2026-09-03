<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>B.POINT — Move More, Move Live</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&family=Inter:wght@400;600;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section class="hero" id="home">
  <div class="container hero-grid">
    <div>
      <span class="hero-eyebrow">B.POINT BASKETBALL</span>
      <h1>MOVE MORE,<br>MOVE <span class="o">LIVE.</span></h1>
      <p class="lead">단순한 활동을 넘어 더 깊은 움직임으로.<br>무의식 속의 더 선명한 삶을 위한 농구 클래스.</p>
      <div class="hero-cta">
        <a class="btn btn-primary" href="https://smartstore.naver.com" target="_blank" rel="noopener">클래스 바로가기 →</a>
        <a class="btn btn-ghost" href="${pageContext.request.contextPath}/about">브랜드 알아보기</a>
      </div>
    </div>
    <div class="hero-visual">
      <div class="logo-card"><img src="${pageContext.request.contextPath}/assets/images/메인 이미지 로고.png" alt="B.POINT" class="hero-logo" /></div>
    </div>
  </div>
</section>

<div class="marquee" aria-hidden="true">
  <div class="marquee-track">
    <span>MOVE MORE <span class="sep">●</span> MOVE LIVE <span class="sep">●</span> GROWTH BEYOND SCORE <span class="sep">●</span> RESILIENCE <span class="sep">●</span> INNOVATIVE EXPERIENCE <span class="sep">●</span></span>
    <span>MOVE MORE <span class="sep">●</span> MOVE LIVE <span class="sep">●</span> GROWTH BEYOND SCORE <span class="sep">●</span> RESILIENCE <span class="sep">●</span> INNOVATIVE EXPERIENCE <span class="sep">●</span></span>
  </div>
</div>

<section id="about">
  <div class="container">
    <span class="eyebrow">ABOUT B.POINT</span>
    <h2 class="section-title">스포츠의 진정한 가치는<br><span class="o">스코어보드 너머에</span> 있습니다.</h2>
    <p class="section-sub">우리는 당신이 흘린 땀방울 속에 숨겨진 미세한 변화에 집중합니다. 결과에 매몰되지 않고, 과정 속에서 스스로의 성장을 느끼는 새로운 스포츠 문화를 만들어 갑니다.</p>
    <div class="vision-grid">
      <div class="vision-card">
        <div class="vision-num">01</div>
        <h3>회복탄력성<br><small style="font-size:13px;font-weight:600;color:var(--gray-400);letter-spacing:.1em">RESILIENCE</small></h3>
        <p style="margin-top:14px">실패나 실책 직후의 압박감 속에서도 다시 평정심을 찾고, 최적의 몰입 상태로 돌아가는 멘탈의 힘을 길러줍니다.</p>
      </div>
      <div class="vision-card">
        <div class="vision-num">02</div>
        <h3>성장 중심<br><small style="font-size:13px;font-weight:600;color:var(--gray-400);letter-spacing:.1em">GROWTH-ORIENTED</small></h3>
        <p style="margin-top:14px">승패나 기록 같은 단편적인 결과보다, 그 과정에서 개인이 체득하는 작은 성취와 지속적인 도약을 가장 가치 있게 여깁니다.</p>
      </div>
      <div class="vision-card">
        <div class="vision-num">03</div>
        <h3>혁신적 경험<br><small style="font-size:13px;font-weight:600;color:var(--gray-400);letter-spacing:.1em">INNOVATIVE EXPERIENCE</small></h3>
        <p style="margin-top:14px">엘리트 스포츠의 정교한 멘탈 케어 방식을 대중화하여, 누구나 자신의 성장을 즐기는 새로운 스포츠 문화를 선도합니다.</p>
      </div>
    </div>
    <div style="margin-top:48px;text-align:center"><a class="btn btn-line" href="${pageContext.request.contextPath}/about">소개 자세히 보기 →</a></div>
  </div>
</section>

<section id="story">
  <div class="container">
    <span class="eyebrow">OUR STORY</span>
    <h2 class="section-title">0.1mm의 오차에서 시작된,<br><span class="o">정직한 성장의 거울.</span></h2>
    <div class="story-grid">
      <div>
        <div class="story-quote">"스포츠가 단순한 승패의 결과물이 아닌,<br>자신의 무의식을 비추고<br><span class="o">어제보다 나은 나를</span> 발견하는<br>정직한 성장의 거울이 되기를."</div>
      </div>
      <div class="story-text">
        <p>22살까지 엘리트 사격 선수로 사선(射線)에 서며, 0.1mm의 오차로 승패가 갈리는 냉혹한 승부의 세계를 온몸으로 겪었습니다. 단 한 번의 격발에 수년간의 노력이 결정되는 압박감 속에서 마주한 진실은 명확했습니다. 결국 기술보다 중요한 것은 '흔들리는 마음'을 다스리는 평정심이라는 사실이었습니다.</p>
        <p>선수 생활을 마친 후 생활체육의 현장에서 사람들을 가르치며 한 가지 소망이 생겼습니다. 숫자로 기록되는 점수에 매몰되어 스스로를 갉아먹는 것이 아니라, 미세한 떨림 속에서도 다시 중심을 잡으려 애쓰는 그 고귀한 과정에서 진짜 성취감을 느끼는 문화를 만들고 싶었습니다.</p>
        <p>이제 사격 선수 시절의 정교한 감각과 수많은 지도 경험을 결합하여, 타인과의 경쟁이 아닌 오직 자신의 성장에만 몰입할 수 있는 특별한 스포츠 경험을 열어갑니다.</p>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/story" style="margin-top:32px">스토리 전문 보기 →</a>
      </div>
    </div>
  </div>
</section>

<section id="programs">
  <div class="container">
    <span class="eyebrow">PROGRAMS</span>
    <h2 class="section-title">승패를 넘어 우리를 하나로 잇는,<br><span class="o">함께 성장하는</span> 스포츠 경험.</h2>
    <p class="section-sub">엘리트 사격 선수의 정밀한 감각과 멘탈 수련 노하우를 농구 교육에 접목했습니다.</p>
    <div class="program-grid">
      <div class="program class">
        <div>
          <span class="program-tag">CLASS</span>
          <h3>나를 마주하고,<br>어제보다 단단해지는 시간.</h3>
          <p class="ko">개인 · 그룹 농구 클래스</p>
          <ul>
            <li><strong>몰입의 기술 전수</strong>사격 선수의 호흡법·마인드 컨트롤 기법.</li>
            <li><strong>성장 중심 피드백</strong>점수가 아닌 수행 과정의 심리 변화에 집중.</li>
            <li><strong>무의식 멘탈 코칭</strong>심리적 압박의 원인을 데이터로 찾기.</li>
          </ul>
        </div>
        <a class="btn btn-primary" style="margin-top:28px;width:fit-content" href="${pageContext.request.contextPath}/class">CLASS 자세히 보기 →</a>
      </div>
      <div class="program event">
        <div>
          <span class="program-tag" style="background:rgba(0,0,0,.18);color:#fff">EVENT</span>
          <h3>성취를 공유하고<br>즐거움으로 하나 되는 축제.</h3>
          <p class="ko">대회 · 행사 · 커뮤니티</p>
          <ul>
            <li><strong>포용적 경쟁 시스템</strong>각자의 목표를 달성한 모두가 주인공.</li>
            <li><strong>통합의 장 마련</strong>실력 차이를 넘어 스포츠로 소통.</li>
            <li><strong>성장의 궤적 공유</strong>각자의 한계를 넓혀가는 과정 응원.</li>
          </ul>
        </div>
        <a class="btn btn-dark" style="margin-top:28px;width:fit-content" href="${pageContext.request.contextPath}/event">EVENT 자세히 보기 →</a>
      </div>
    </div>
  </div>
</section>

<section id="news">
  <div class="container">
    <span class="eyebrow">NEWS & STORIES</span>
    <h2 class="section-title">B.POINT의 <span class="o">움직임.</span></h2>
    <p class="section-sub">클래스 현장, 이벤트 후기, 그리고 우리가 만들어가는 변화의 기록들.</p>
    <div class="news-grid">
      <article class="news-card" onclick="location.href='${pageContext.request.contextPath}/news'" style="cursor:pointer">
        <div class="news-thumb t1"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="" class="news-mark" /></div>
        <div class="news-body">
          <span class="news-tag">CLASS</span>
          <h4>첫 클래스를 마치며 — 작은 떨림이 만든 큰 변화</h4>
          <p>슈팅 자세보다 호흡과 시선을 먼저 가르친 첫 주차. 수강생들의 미세한 변화를 기록했습니다.</p>
          <div class="news-meta">2026.05.08</div>
        </div>
      </article>
      <article class="news-card">
        <div class="news-thumb t2"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="" class="news-mark" /></div>
        <div class="news-body">
          <span class="news-tag">EVENT</span>
          <h4>모두가 주인공이 되는 농구 이벤트 'POINT DAY' 개최</h4>
          <p>승패가 아닌 '오늘의 나의 성장'을 기록하는 새로운 형식의 농구 페스티벌.</p>
          <div class="news-meta">2026.04.22</div>
        </div>
      </article>
      <article class="news-card">
        <div class="news-thumb t3"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt="" class="news-mark" /></div>
        <div class="news-body">
          <span class="news-tag">STORY</span>
          <h4>왜 사격 출신 코치가 농구를 가르치는가</h4>
          <p>0.1mm의 오차와 골밑의 1초 — 두 종목이 만나는 '평정심'이라는 공통어.</p>
          <div class="news-meta">2026.04.05</div>
        </div>
      </article>
    </div>
    <div style="margin-top:48px;text-align:center"><a class="btn btn-line" href="${pageContext.request.contextPath}/news">전체 소식 보기 →</a></div>
  </div>
</section>

<section id="contact">
  <div class="container">
    <span class="eyebrow">CONTACT</span>
    <h2 class="section-title">함께 만들고 싶은 <span class="o">움직임</span>이 있다면.</h2>
    <p class="section-sub" style="color:#9AA1A6">협력 제안, 단체 수업 요청, 클래스 문의 모두 환영합니다.</p>
    <div class="contact-wrap">
      <div class="contact-info">
        <div class="info-row"><span class="lbl">CLASS</span><span class="val">개인 · 그룹 농구 클래스 신청 및 일정 문의</span></div>
        <div class="info-row"><span class="lbl">PARTNER</span><span class="val">학교 · 기업 · 단체 협력 프로그램 제안</span></div>
        <div class="info-row"><span class="lbl">EVENT</span><span class="val">이벤트 · 대회 참가 및 단체 행사 의뢰</span></div>
        <div class="info-row"><span class="lbl">EMAIL</span><span class="val">contact@bpoint.kr</span></div>
        <div class="info-row"><span class="lbl">INSTAGRAM</span><span class="val">@bpoint.basketball</span></div>
      </div>
      <form class="cform-wrap" action="${pageContext.request.contextPath}/inquiries" method="post">
        <div class="field-row">
          <div class="field"><label>이름</label><input type="text" name="name" required placeholder="홍길동" /></div>
          <div class="field"><label>연락처 / 이메일</label><input type="text" name="contact" required placeholder="010-0000-0000" /></div>
        </div>
        <div class="field"><label>문의 유형</label>
          <select name="type" required>
            <option value="">선택해주세요</option>
            <option>협력</option>
            <option>단체 수업 요청</option>
            <option>질문</option>
            <option>기타</option>
          </select>
        </div>
        <div class="field"><label>문의 내용</label><textarea name="message" required placeholder="요청 사항을 자유롭게 적어주세요."></textarea></div>
        <button type="submit">문의 보내기</button>
      </form>
    </div>
    <div style="margin-top:48px;text-align:center"><a class="btn btn-ghost" href="${pageContext.request.contextPath}/contact">문의 페이지 자세히 →</a></div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>