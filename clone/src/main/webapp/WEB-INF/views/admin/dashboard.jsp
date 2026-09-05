<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>대시보드 — B.POINT Admin</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-styles.css" />
<meta name="ctx" content="${pageContext.request.contextPath}">
</head>
<body>

<div id="sidebar-slot"></div>

<main class="app">
  <div class="topbar">
    <div><h1>대시보드</h1><div class="crumbs">관리자 / 대시보드</div></div>
  </div>
  <div class="content">

    <div class="stat-grid">
      <div class="stat">
        <div class="lbl">공지·자료</div>
        <div class="val">${noticeCount}</div>
        <div class="delta">전체 등록 수</div>
      </div>
      <div class="stat">
        <div class="lbl">소식</div>
        <div class="val">${newsCount}</div>
        <div class="delta">전체 게시글</div>
      </div>
      <div class="stat">
        <div class="lbl">전체 문의</div>
        <div class="val"><span class="o">${inquiryCount}</span></div>
        <div class="delta">누적 접수 건수</div>
      </div>
    </div>

    <div class="panel">
      <div class="panel-head">
        <h2>최근 문의</h2>
        <div class="actions"><a class="btn btn-line btn-sm" href="${pageContext.request.contextPath}/admin/inquiries">전체 보기 →</a></div>
      </div>
      <div class="panel-body">
        <table class="dt">
          <thead><tr><th style="width:120px">유형</th><th>이름</th><th>내용</th><th style="width:140px">접수일</th><th></th></tr></thead>
          <tbody>
            <c:choose>
              <c:when test="${empty recentInquiries}">
                <tr><td colspan="5"><div class="empty"><div class="ico">✉</div><p>접수된 문의가 없습니다.</p></div></td></tr>
              </c:when>
              <c:otherwise>
                <c:forEach var="i" items="${recentInquiries}">
                  <tr onclick="location.href='${pageContext.request.contextPath}/admin/inquiries/${i.id}'">
                    <td><span class="badge-tag pending">${i.type}</span></td>
                    <td style="font-weight:700">${i.name}</td>
                    <td style="color:var(--soft);max-width:380px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis">
                      ${fn:substring(i.message, 0, fn:length(i.message) > 80 ? 80 : fn:length(i.message))}
                    </td>
                    <td style="color:var(--muted)">${i.createdAt}</td>
                    <td class="actions"><a class="btn btn-line btn-sm" href="${pageContext.request.contextPath}/admin/inquiries/${i.id}">보기 →</a></td>
                  </tr>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>
    </div>

    <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px">
      <div class="panel">
        <div class="panel-head"><h2>최근 공지·자료</h2><a class="btn btn-line btn-sm" href="${pageContext.request.contextPath}/admin/notices">관리 →</a></div>
        <div class="panel-body">
          <table class="dt">
            <thead><tr><th style="width:80px">유형</th><th>제목</th><th style="width:120px">날짜</th></tr></thead>
            <tbody>
              <c:choose>
                <c:when test="${empty recentNotices}">
                  <tr><td colspan="3"><div class="empty"><p>등록된 공지가 없습니다.</p></div></td></tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="n" items="${recentNotices}">
                    <tr onclick="location.href='${pageContext.request.contextPath}/admin/notices'">
                      <td><span class="badge-tag ${n.type == 'data' ? 'data' : 'notice'}">${n.type == 'data' ? '자료' : '공지'}</span></td>
                      <td style="font-weight:600">${n.title}</td>
                      <td style="color:var(--muted)">${n.postDate}</td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
      </div>
      <div class="panel">
        <div class="panel-head"><h2>최근 소식</h2><a class="btn btn-line btn-sm" href="${pageContext.request.contextPath}/admin/news">관리 →</a></div>
        <div class="panel-body">
          <table class="dt">
            <thead><tr><th style="width:80px">카테고리</th><th>제목</th><th style="width:120px">날짜</th></tr></thead>
            <tbody>
              <c:choose>
                <c:when test="${empty recentNews}">
                  <tr><td colspan="3"><div class="empty"><p>등록된 소식이 없습니다.</p></div></td></tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="p" items="${recentNews}">
                    <tr onclick="location.href='${pageContext.request.contextPath}/admin/news'">
                      <td><span class="badge-tag ${p.category}">${fn:toUpperCase(p.category)}</span></td>
                      <td style="font-weight:600">${p.title}</td>
                      <td style="color:var(--muted)">${p.postDate}</td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
</main>

<script src="${pageContext.request.contextPath}/admin-common.js"></script>
<script>
  renderSidebar('dashboard');
</script>
</body>
</html>