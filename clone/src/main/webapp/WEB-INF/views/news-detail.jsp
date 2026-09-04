<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>첫 클래스를 마치며 — B.POINT</title>
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
      <a href="${pageContext.request.contextPath}/news">소식</a> &nbsp;/&nbsp; 클래스 후기
    </div>
    <div class="post-header">
      <h1><span class="tag">[CLASS]</span>첫 클래스를 마치며 — 작은 떨림이 만든 큰 변화</h1>
      <div class="post-meta">2026-05-08</div>
    </div>
    <div class="post-image"><img src="${pageContext.request.contextPath}/assets/images/헤더 로고.png" alt=""></div>
    <div class="post-body">
      <p>B.POINT의 첫 번째 그룹 클래스를 마쳤습니다. 90분 동안 6명의 수강생과 함께 한 시간이었고, 한 가지 사실을 다시 확인했습니다. <strong>처음 만난 사람들도, 같은 호흡 안에서는 빠르게 가까워진다</strong>는 것입니다.</p>
      <p>첫 시간에는 의도적으로 슛 자세를 가르치지 않았습니다. 대신 90분의 절반을 '호흡'과 '시선'에 썼습니다. 농구공을 들기 전에, 발끝부터 어깨까지 어디가 어떻게 긴장되어 있는지 스스로 느끼는 시간을 가졌습니다.</p>
      <p>사격 선수 시절에 가장 먼저 배운 것은 격발의 정확함이 아니라 '격발 직전의 호흡'이었습니다. 모든 동작은 호흡의 끝자락에서 일어납니다. 농구의 슛도 마찬가지였습니다.</p>
      <p>첫 슛을 던지고 "저는 슛이 원래 안 들어가요"라고 웃으며 말씀하신 분이 있었습니다. 자세를 바로잡지 않고, 한 가지만 요청드렸습니다. <strong>"숨을 쉬는 순간, 어디서 멈추고 어디서 던지는지만 천천히 관찰해 보세요."</strong> 그 분은 30분 뒤 같은 거리에서 3번 연속 림을 맞췄습니다.</p>
      <p>점수판은 없었습니다. 대신 6명 각자의 '오늘의 도약'이 노트에 한 줄씩 기록되었습니다. 다음 주에 우리는 이 노트를 다시 꺼낼 것이고, 한 줄씩 더해갈 것입니다.</p>
      <p>이게 우리가 만들고 싶었던 농구 클래스입니다. 잘 가르치는 것이 아니라, 함께 잘 자라는 것. 다음 주에 다시 만나요.</p>
    </div>
    <nav class="post-nav">
      <div class="row"><div class="dir">이전글</div><a href="${pageContext.request.contextPath}/news-detail"><span class="cat">[STORY]</span>'다시 일어서는 마음'을 가르치는 법</a></div>
      <div class="row"><div class="dir">다음글</div><a href="${pageContext.request.contextPath}/news-detail"><span class="cat">[EVENT]</span>모두가 주인공이 되는 농구 페스티벌 'POINT DAY'</a></div>
    </nav>
    <div class="post-actions"><a class="btn btn-line" href="${pageContext.request.contextPath}/news">목록 →</a></div>
  </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>