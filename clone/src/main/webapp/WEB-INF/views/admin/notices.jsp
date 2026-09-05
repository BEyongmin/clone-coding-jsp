<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="ctx" content="${pageContext.request.contextPath}">
<title>공지·자료실 관리 — B.POINT Admin</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;700;800;900&family=Archivo+Black&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin-styles.css" />
</head>
<body>

<div id="sidebar-slot"></div>

<main class="app">
  <div class="topbar">
    <div><h1>공지·자료실</h1><div class="crumbs">관리자 / 공지·자료실</div></div>
    <div class="right"><button class="btn btn-primary" onclick="openModal()">+ 새 글 작성</button></div>
  </div>
  <div class="content">
    <div class="panel">
      <div class="panel-head">
        <h2>전체 글 <span id="cnt" style="color:var(--muted);font-weight:600;margin-left:4px"></span></h2>
        <div class="actions">
          <select id="filter" class="btn btn-line btn-sm" style="padding-right:24px">
            <option value="all">전체 유형</option><option value="notice">공지</option><option value="data">자료</option>
          </select>
          <input type="text" id="search" class="btn btn-line btn-sm" placeholder="제목 검색" style="font-weight:500;min-width:200px" />
        </div>
      </div>
      <div class="panel-body">
        <table class="dt" id="tbl"><thead><tr><th style="width:80px">유형</th><th>제목</th><th style="width:120px">날짜</th><th style="width:200px"></th></tr></thead><tbody></tbody></table>
      </div>
    </div>
  </div>
</main>

<div class="modal-back" id="modal">
  <div class="modal">
    <div class="modal-head"><h3 id="mTitle">새 공지·자료 작성</h3><button class="close" onclick="closeModal()">✕</button></div>
    <div class="modal-body">
      <form id="form" onsubmit="event.preventDefault(); save();">
        <input type="hidden" id="f-id" />
        <div class="fld"><label>유형</label><select id="f-type" required><option value="notice">공지사항</option><option value="data">자료실</option></select></div>
        <div class="fld"><label>제목 *</label><input type="text" id="f-title" required placeholder="제목을 입력하세요" /></div>
        <div class="fld"><label>날짜</label><input type="date" id="f-date" /></div>
        <div class="fld"><label>본문</label><textarea id="f-content" placeholder="본문 내용 또는 자료에 대한 설명을 입력하세요."></textarea></div>
        <div class="fld">
          <label>첨부 파일 (자료용, 선택)</label>
          <input type="file" id="f-file" />
          <p id="currentFileInfo" style="font-size:12px;color:var(--muted);margin-top:6px"></p>
          <label id="removeFileWrap" style="display:none;align-items:center;gap:8px;margin-top:8px;cursor:pointer;text-transform:none;letter-spacing:0;font-size:13px;color:var(--red)">
            <input type="checkbox" id="f-removeFile" style="width:auto;margin:0;cursor:pointer" />
            기존 첨부파일 제거
          </label>
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
  renderSidebar('notices');

  const API = document.querySelector('meta[name="ctx"]').content + '/admin/notices/api';
  let allNotices = [];
  let filterType = 'all';
  let searchQ = '';

  async function loadAndRender() {
    const res = await fetch(API);
    allNotices = await res.json();
    render();
  }

  function render() {
    let arr = allNotices;
    if (filterType !== 'all') arr = arr.filter(n => n.type === filterType);
    if (searchQ) arr = arr.filter(n => (n.title || '').toLowerCase().includes(searchQ.toLowerCase()));

    document.getElementById('cnt').textContent = `(\${arr.length}건)`;
    const tbody = document.querySelector('#tbl tbody');

    if (arr.length === 0) {
      tbody.innerHTML = `<tr><td colspan="4"><div class="empty"><div class="ico">▤</div><p>등록된 글이 없습니다.</p><button class="btn btn-primary btn-sm" onclick="openModal()">+ 새 글 작성</button></div></td></tr>`;
      return;
    }

    tbody.innerHTML = arr.map(n => `
      <tr onclick="editItem(\${n.id})">
        <td><span class="badge-tag \${n.type === 'data' ? 'data' : 'notice'}">\${n.type === 'data' ? '자료실' : '공지사항'}</span></td>
        <td style="font-weight:600">\${escapeHtml(n.title)}</td>
        <td style="color:var(--muted)">\${fmtDate(n.postDate)}</td>
        <td class="actions">
          <button class="btn btn-line btn-sm" onclick="event.stopPropagation();editItem(\${n.id})">수정</button>
          <button class="btn btn-danger btn-sm" onclick="event.stopPropagation();confirmDelete(\${n.id})">삭제</button>
        </td>
      </tr>`).join('');
  }

  function openModal(item) {
    document.getElementById('mTitle').textContent = item ? '글 수정' : '새 공지·자료 작성';
    document.getElementById('f-id').value = item?.id || '';
    document.getElementById('f-type').value = item?.type || 'notice';
    document.getElementById('f-title').value = item?.title || '';
    document.getElementById('f-date').value = item?.postDate || new Date().toISOString().slice(0, 10);
    document.getElementById('f-content').value = item?.content || '';
    document.getElementById('f-file').value = '';
    document.getElementById('f-removeFile').checked = false;

    const fileInfo = document.getElementById('currentFileInfo');
    const removeWrap = document.getElementById('removeFileWrap');
    if (item?.fileName) {
      fileInfo.textContent = `현재 파일: \${item.fileName} (\${item.fileSize || ''})`;
      removeWrap.style.display = 'flex';
    } else {
      fileInfo.textContent = '';
      removeWrap.style.display = 'none';
    }

    document.getElementById('delBtn').style.display = item ? 'inline-flex' : 'none';
    document.getElementById('modal').classList.add('open');
  }

  function closeModal() {
    document.getElementById('modal').classList.remove('open');
  }

  function editItem(id) {
    const item = allNotices.find(n => n.id === id);
    openModal(item);
  }

  async function save() {
    const id = document.getElementById('f-id').value;
    const title = document.getElementById('f-title').value.trim();
    if (!title) {
      alert('제목을 입력하세요.');
      return;
    }

    const data = {
      type: document.getElementById('f-type').value,
      title: title,
      date: document.getElementById('f-date').value,
      content: document.getElementById('f-content').value.trim(),
      removeFile: document.getElementById('f-removeFile').checked
    };

    const formData = new FormData();
    formData.append('data', new Blob([JSON.stringify(data)], { type: 'application/json' }));

    const fileInput = document.getElementById('f-file');
    if (fileInput.files.length > 0) {
      formData.append('file', fileInput.files[0]);
    }

    const url = id ? `\${API}/\${id}` : API;
    const method = id ? 'PUT' : 'POST';

    const res = await fetch(url, {
      method: method,
      body: formData
    });

    if (!res.ok) {
      alert('저장에 실패했습니다.');
      return;
    }

    closeModal();
    await loadAndRender();
  }

  async function confirmDelete(id) {
    if (!confirm('이 글을 삭제할까요?')) return;
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

  document.getElementById('filter').addEventListener('change', e => { filterType = e.target.value; render(); });
  document.getElementById('search').addEventListener('input', e => { searchQ = e.target.value; render(); });
  document.getElementById('modal').addEventListener('click', e => { if (e.target.id === 'modal') closeModal(); });

  loadAndRender();
</script>
</body>
</html>