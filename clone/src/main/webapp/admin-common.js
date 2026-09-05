/* ============================================================
   B.POINT ADMIN — Common JS (서버 연동 버전)
   ============================================================ */

// ========= UTIL =========
function fmtDate(iso){
  if(!iso) return '';
  const d = new Date(iso);
  if(isNaN(d)) return iso;
  const y=d.getFullYear(), m=String(d.getMonth()+1).padStart(2,'0'), dd=String(d.getDate()).padStart(2,'0');
  return `${y}.${m}.${dd}`;
}
function fmtDateTime(iso){
  if(!iso) return '';
  const d = new Date(iso);
  if(isNaN(d)) return iso;
  return d.toLocaleString('ko-KR',{year:'numeric',month:'2-digit',day:'2-digit',hour:'2-digit',minute:'2-digit'});
}

// ========= SIDEBAR INJECT =========
function renderSidebar(active){
  const ctx = document.querySelector('meta[name="ctx"]')?.content || '';
  const html = `
    <aside class="sidebar">
      <div class="side-brand">
        <img src="${ctx}/assets/images/헤더 로고.png" alt="" style="height:22px;width:auto;object-fit:contain">
      </div>
      <nav class="side-menu">
        <a href="${ctx}/admin" class="${active==='dashboard'?'active':''}"><span class="ico">◆</span>대시보드</a>
        <a href="${ctx}/admin/notices" class="${active==='notices'?'active':''}"><span class="ico">▤</span>공지·자료실</a>
        <a href="${ctx}/admin/news" class="${active==='news'?'active':''}"><span class="ico">▦</span>소식 관리</a>
        <a href="${ctx}/admin/inquiries" class="${active==='inquiries'?'active':''}"><span class="ico">✉</span>문의 관리</a>
        <a href="${ctx}/" target="_blank"><span class="ico">↗</span>사이트 보기</a>
      </nav>
      <div class="side-foot">
        <div class="side-user">
          <div class="av">B</div>
          <div>
            <div class="nm">B.POINT</div>
            <div class="role">관리자</div>
          </div>
        </div>
        <a class="logout" href="${ctx}/admin/logout">로그아웃</a>
      </div>
    </aside>
  `;
  const slot = document.getElementById('sidebar-slot');
  if(slot) slot.outerHTML = html;
}