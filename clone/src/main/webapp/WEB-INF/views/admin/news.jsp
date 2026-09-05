<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="ctx" content="${pageContext.request.contextPath}">
<title>소식 관리 — B.POINT Admin</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-styles.css" />
</head>
<body>

<div id="sidebar-slot"></div>

<main class="app">
  <div class="topbar">
    <div><h1>소식 관리</h1><div class="crumbs">관리자 / 소식 관리</div></div>
    <div class="right"><button class="btn btn-primary" onclick="openModal()">+ 새 글 작성</button></div>
  </div>
  <div class="content">
    <div class="panel">
      <div class="panel-head">
        <h2>전체 소식 <span id="cnt" style="color:var(--muted);font-weight:600;margin-left:4px"></span></h2>
        <div class="actions">
          <select id="filter" class="btn btn-line btn-sm" style="padding-right:24px">
            <option value="all">전체 카테고리</option><option value="class">CLASS</option><option value="event">EVENT</option><option value="story">STORY</option>
          </select>
          <input type="text" id="search" class="btn btn-line btn-sm" placeholder="제목 검색" style="font-weight:500;min-width:200px" />
        </div>
      </div>
      <div class="panel-body">
        <table class="dt" id="tbl"><thead><tr><th style="width:90px">카테고리</th><th>제목</th><th style="width:120px">날짜</th><th style="width:120px">작성자</th><th style="width:200px"></th></tr></thead><tbody></tbody></table>
      </div>
    </div>
  </div>
</main>

<div class="modal-back" id="modal">
  <div class="modal" style="max-width:680px">
    <div class="modal-head"><h3 id="mTitle">새 소식 작성</h3><button class="close" onclick="closeModal()">✕</button></div>
    <div class="modal-body">
      <form id="form" onsubmit="event.preventDefault(); save();">
        <input type="hidden" id="f-id" />
        <div class="fld-row">
          <div class="fld"><label>카테고리 *</label><select id="f-category" required><option value="class">CLASS</option><option value="event">EVENT</option><option value="story">STORY</option></select></div>
          <div class="fld"><label>날짜</label><input type="date" id="f-date" /></div>
        </div>
        <div class="fld"><label>제목 *</label><input type="text" id="f-title" required placeholder="제목을 입력하세요" /></div>
        <div class="fld"><label>요약</label><textarea id="f-excerpt" style="min-height:60px" placeholder="짧은 요약문 (1~2문장)"></textarea></div>
        <div class="fld"><label>본문 *</label><textarea id="f-content" required style="min-height:180px" placeholder="기사 본문"></textarea></div>
        <div class="fld-row">
          <div class="fld"><label>작성자</label><input type="text" id="f-author" placeholder="B.POINT" /></div>
          <div class="fld"><label>대표 이미지 URL</label><input type="text" id="f-image" placeholder="https://... 또는 assets/..." /></div>
        </div>
        <div class="fld" id="event-option" style="display:none;background:#FFF6F2;border:1px solid var(--orange);border-radius:8px;padding:14px 16px">
          <label style="display:flex;align-items:center;gap:10px;cursor:pointer;margin:0;color:var(--ink)">
            <input type="checkbox" id="f-show-in-event" style="width:auto;margin:0;cursor:pointer" />
            <span style="text-transform:none;letter-spacing:0;font-size:14px;color:var(--ink)">이벤트 상세 페이지 '사례' 항목에 표시</span>
          </label>
          <p style="font-size:12px;color:var(--soft);margin:8px 0 0 26px;line-height:1.5">체크하면 사용자 화면의 <strong>이벤트 페이지 → 함께한 사례들</strong> 영역에 노출됩니다.</p>
        </div>
      </form>
    </div>
    <div class="modal-foot">
      <button class="btn btn-danger btn-sm" id="delBtn" onclick="removeItem()" style="margin-right:auto;display:none">삭제</button>
      <button class="btn btn-line" onclick="closeModal()">취소</button>
      <button class="btn btn-primary" onclick="save()">저장</button>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/admin-common.js"></script>
<script>
  renderSidebar('news');

  const API = document.querySelector('meta[name="ctx"]').content + '/admin/news/api';
  let allNews = [];
  let filterCat = 'all';
  let searchQ = '';

  async function loadAndRender() {
    const res = await fetch(API);
    allNews = await res.json();
    render();
  }

  function render() {
    let arr = allNews;
    if (filterCat !== 'all') arr = arr.filter(p => p.category === filterCat);
    if (searchQ) arr = arr.filter(p => (p.title || '').toLowerCase().includes(searchQ.toLowerCase()));

    document.getElementById('cnt').textContent = `(\${arr.length}건)`;
    const tbody = document.querySelector('#tbl tbody');

    if (arr.length === 0) {
      tbody.innerHTML = `<tr><td colspan="5"><div class="empty"><div class="ico">▦</div><p>등록된 소식이 없습니다.</p><button class="btn btn-primary btn-sm" onclick="openModal()">+ 새 글 작성</button></div></td></tr>`;
      return;
    }

    tbody.innerHTML = arr.map(p => `
      <tr onclick="editItem(\${p.id})">
        <td><span class="badge-tag \${p.category}">\${(p.category || '').toUpperCase()}</span>\${p.showInEvent ? '<span class="badge-tag new" style="margin-left:4px;font-size:9px">사례</span>' : ''}</td>
        <td>
          <div style="font-weight:600;margin-bottom:4px">\${escapeHtml(p.title)}</div>
          <div style="font-size:12px;color:var(--muted);max-width:560px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis">\${escapeHtml(p.excerpt || '')}</div>
        </td>
        <td style="color:var(--muted)">\${fmtDate(p.postDate)}</td>
        <td style="color:var(--soft)">\${escapeHtml(p.author || 'B.POINT')}</td>
        <td class="actions">
          <button class="btn btn-line btn-sm" onclick="event.stopPropagation();editItem(\${p.id})">수정</button>
          <button class="btn btn-danger btn-sm" onclick="event.stopPropagation();confirmDelete(\${p.id})">삭제</button>
        </td>
      </tr>`).join('');
  }

  function openModal(item) {
    document.getElementById('mTitle').textContent = item ? '소식 수정' : '새 소식 작성';
    document.getElementById('f-id').value = item?.id || '';
    document.getElementById('f-category').value = item?.category || 'class';
    document.getElementById('f-date').value = item?.postDate || new Date().toISOString().slice(0, 10);
    document.getElementById('f-title').value = item?.title || '';
    document.getElementById('f-excerpt').value = item?.excerpt || '';
    document.getElementById('f-content').value = item?.content || '';
    document.getElementById('f-author').value = item?.author || 'B.POINT';
    document.getElementById('f-image').value = item?.image || '';
    document.getElementById('f-show-in-event').checked = !!item?.showInEvent;
    toggleEventOption();
    document.getElementById('delBtn').style.display = item ? 'inline-flex' : 'none';
    document.getElementById('modal').classList.add('open');
  }

  function toggleEventOption() {
    const cat = document.getElementById('f-category').value;
    document.getElementById('event-option').style.display = cat === 'event' ? 'block' : 'none';
  }
  document.getElementById('f-category').addEventListener('change', toggleEventOption);

  function closeModal() {
    document.getElementById('modal').classList.remove('open');
  }

  function editItem(id) {
    const item = allNews.find(p => p.id === id);
    openModal(item);
  }

  async function save() {
    const id = document.getElementById('f-id').value;
    const data = {
      category: document.getElementById('f-category').value,
      title: document.getElementById('f-title').value.trim(),
      excerpt: document.getElementById('f-excerpt').value.trim(),
      content: document.getElementById('f-content').value.trim(),
      author: document.getElementById('f-author').value.trim() || 'B.POINT',
      image: document.getElementById('f-image').value.trim() || null,
      date: document.getElementById('f-date').value,
      showInEvent: document.getElementById('f-category').value === 'event' && document.getElementById('f-show-in-event').checked
    };
    if (!data.title || !data.content) {
      alert('제목과 본문은 필수입니다.');
      return;
    }

    const url = id ? `\${API}/\${id}` : API;
    const method = id ? 'PUT' : 'POST';

    const res = await fetch(url, {
      method: method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });

    if (!res.ok) {
      alert('저장에 실패했습니다.');
      return;
    }

    closeModal();
    await loadAndRender();
  }

  async function confirmDelete(id) {
    if (!confirm('이 소식을 삭제할까요?')) return;
    await fetch(`\${API}/\${id}`, { method: 'DELETE' });
    await loadAndRender();
  }

  function removeItem() {
    const id = document.getElementById('f-id').value;
    if (id) {
      confirmDelete(Number(id)).then(closeModal);
    }
  }

  function escapeHtml(s) {
    return (s || '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  }

  document.getElementById('filter').addEventListener('change', e => { filterCat = e.target.value; render(); });
  document.getElementById('search').addEventListener('input', e => { searchQ = e.target.value; render(); });
  document.getElementById('modal').addEventListener('click', e => { if (e.target.id === 'modal') closeModal(); });

  loadAndRender();
</script>
</body>
</html>