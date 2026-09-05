<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="ctx" content="${pageContext.request.contextPath}">
<title>문의 관리 — B.POINT Admin</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-styles.css" />
</head>
<body>

<div id="sidebar-slot"></div>

<main class="app">
  <div class="topbar">
    <div><h1>문의 관리</h1><div class="crumbs">관리자 / 문의 관리</div></div>
    <div class="right"><span id="summary" style="font-size:13px;color:var(--soft)"></span></div>
  </div>
  <div class="content">
    <div class="panel">
      <div class="panel-head">
        <h2>접수된 문의 <span id="cnt" style="color:var(--muted);font-weight:600;margin-left:4px"></span></h2>
        <div class="actions">
          <select id="filterType" class="btn btn-line btn-sm" style="padding-right:24px">
            <option value="all">전체 유형</option><option value="협력">협력</option><option value="단체 수업 요청">단체 수업 요청</option><option value="질문">질문</option><option value="기타">기타</option>
          </select>
        </div>
      </div>
      <div class="panel-body">
        <table class="dt" id="tbl"><thead><tr><th style="width:140px">유형</th><th style="width:120px">이름</th><th>문의 내용</th><th style="width:160px">접수일</th><th style="width:140px"></th></tr></thead><tbody></tbody></table>
      </div>
    </div>
  </div>
</main>

<div class="modal-back" id="modal">
  <div class="modal" style="max-width:680px">
    <div class="modal-head"><h3>문의 상세</h3><button class="close" onclick="closeModal()">✕</button></div>
    <div class="modal-body">
      <div class="kv" id="kv"></div>
      <div class="message-box" id="msgBox"></div>
      <div id="replyDisplay"></div>
      <div class="fld" id="replyForm" style="margin-top:18px">
        <label>답변 작성</label>
        <textarea id="f-reply" placeholder="답변 내용을 입력하세요."></textarea>
      </div>
    </div>
    <div class="modal-foot">
      <button class="btn btn-danger btn-sm" onclick="removeItem()" style="margin-right:auto">삭제</button>
      <button class="btn btn-line" onclick="closeModal()">닫기</button>
      <button class="btn btn-primary" id="replyBtn" onclick="saveReply()">답변 저장</button>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/admin-common.js"></script>
<script>
  renderSidebar('inquiries');

  const API = document.querySelector('meta[name="ctx"]').content + '/admin/inquiries/api';
  let allInquiries = [];
  let filterType = 'all';
  let currentId = null;

  async function loadAndRender() {
    const res = await fetch(API);
    allInquiries = await res.json();
    render();
  }

  function render() {
    let arr = allInquiries;
    if (filterType !== 'all') arr = arr.filter(i => i.type === filterType);

    document.getElementById('cnt').textContent = `(\${arr.length}건)`;
    document.getElementById('summary').innerHTML = `총 \${allInquiries.length}건`;

    const tbody = document.querySelector('#tbl tbody');
    if (arr.length === 0) {
      tbody.innerHTML = `<tr><td colspan="5"><div class="empty"><div class="ico">✉</div><p>접수된 문의가 없습니다.</p></div></td></tr>`;
      return;
    }

    tbody.innerHTML = arr.map(i => `
      <tr onclick="openDetail(\${i.id})">
        <td><span style="font-weight:700;color:var(--ink)">\${escapeHtml(i.type || '')}</span></td>
        <td style="font-weight:700">\${escapeHtml(i.name || '')}</td>
        <td style="color:var(--soft);max-width:420px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis">\${escapeHtml((i.message || '').slice(0, 100))}</td>
        <td style="color:var(--muted)">\${fmtDateTime(i.createdAt)}</td>
        <td class="actions">
          <span class="badge-tag \${i.status === 'done' ? 'done' : 'pending'}">\${i.status === 'done' ? '답변완료' : '대기중'}</span>
          <button class="btn btn-line btn-sm" onclick="event.stopPropagation();openDetail(\${i.id})">보기</button>
        </td>
      </tr>`).join('');
  }

  function openDetail(id) {
    const i = allInquiries.find(x => x.id === id);
    if (!i) return;
    currentId = id;
    document.getElementById('kv').innerHTML = `
      <div class="k">이름</div><div class="v" style="font-weight:700">\${escapeHtml(i.name)}</div>
      <div class="k">연락처</div><div class="v">\${escapeHtml(i.contact || '')}</div>
      <div class="k">유형</div><div class="v"><span class="badge-tag pending">\${escapeHtml(i.type)}</span></div>
      <div class="k">접수일</div><div class="v muted">\${fmtDateTime(i.createdAt)}</div>`;
    document.getElementById('msgBox').textContent = i.message || '';

    const replyDisplay = document.getElementById('replyDisplay');
    if (i.status === 'done' && i.reply) {
      replyDisplay.innerHTML = `
        <div class="reply-box">
          <div class="lbl">답변 완료 · \${fmtDateTime(i.repliedAt)}</div>
          \${escapeHtml(i.reply)}
        </div>`;
    } else {
      replyDisplay.innerHTML = '';
    }

    document.getElementById('f-reply').value = i.reply || '';
    document.getElementById('modal').classList.add('open');
  }

  function closeModal() {
    document.getElementById('modal').classList.remove('open');
    currentId = null;
  }

  async function saveReply() {
    const replyText = document.getElementById('f-reply').value.trim();
    if (!replyText) {
      alert('답변 내용을 입력하세요.');
      return;
    }
    const res = await fetch(`\${API}/\${currentId}/reply`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ reply: replyText })
    });
    if (!res.ok) {
      alert('답변 저장에 실패했습니다.');
      return;
    }
    closeModal();
    await loadAndRender();
  }

  async function removeItem() {
    if (!currentId) return;
    if (confirm('이 문의를 삭제할까요?')) {
      await fetch(`\${API}/\${currentId}`, { method: 'DELETE' });
      closeModal();
      await loadAndRender();
    }
  }

  function escapeHtml(s) {
    return (s || '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  }

  document.getElementById('filterType').addEventListener('change', e => { filterType = e.target.value; render(); });
  document.getElementById('modal').addEventListener('click', e => { if (e.target.id === 'modal') closeModal(); });

  const params = new URLSearchParams(location.search);
  const openId = params.get('id');

  loadAndRender().then(() => {
    if (openId) openDetail(Number(openId));
  });
</script>
</body>
</html>