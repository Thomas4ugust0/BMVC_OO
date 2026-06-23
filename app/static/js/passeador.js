/* =========================================================
   PETWAY - Área do Passeador (JS)
   ========================================================= */

const DATA = {
  agenda: [
    { name: 'SEG', slots: [
      { time: '08:00', pet: 'Thor',  plan: 'alta',  status: 'completed' },
      { time: '10:00', pet: 'Bebel', plan: 'manut', status: 'completed' },
      { time: '15:00', pet: 'Mel',   plan: 'equi',  status: 'completed' },
    ]},
    { name: 'TER', slots: [
      { time: '07:30', pet: 'Caju',  plan: 'alta',  status: 'completed' },
      { time: '11:00', pet: 'Luna',  plan: 'equi',  status: 'completed' },
      { time: '16:30', pet: 'Thor',  plan: 'alta',  status: 'completed' },
      { time: '18:00', pet: 'Bebel', plan: 'manut', status: 'completed' },
    ]},
    { name: 'QUA', isToday: true, slots: [
      { time: '07:30', pet: 'Thor',  plan: 'alta',  status: 'completed' },
      { time: '09:00', pet: 'Mel',   plan: 'equi',  status: 'completed' },
      { time: '10:30', pet: 'Bebel', plan: 'manut', status: 'running'   },
      { time: '14:00', pet: 'Caju',  plan: 'alta',  status: 'scheduled' },
      { time: '16:30', pet: 'Luna',  plan: 'equi',  status: 'scheduled' },
    ]},
    { name: 'QUI', slots: [
      { time: '08:00', pet: 'Thor',  plan: 'alta',  status: 'scheduled' },
      { time: '10:00', pet: 'Bebel', plan: 'manut', status: 'scheduled' },
      { time: '15:00', pet: 'Mel',   plan: 'equi',  status: 'scheduled' },
    ]},
    { name: 'SEX', slots: [
      { time: '09:00', pet: 'Luna',  plan: 'equi',  status: 'scheduled' },
      { time: '14:30', pet: 'Caju',  plan: 'alta',  status: 'scheduled' },
    ]},
  ],

  today: [
    { time: '07:30', pet: 'Thor',  area: 'Asa Sul',    plan: 'alta',  status: 'done' },
    { time: '09:00', pet: 'Mel',   area: 'Lago Norte', plan: 'equi',  status: 'done' },
    { time: '10:30', pet: 'Bebel', area: 'Asa Norte',  plan: 'manut', status: 'now'  },
    { time: '14:00', pet: 'Caju',  area: 'Sudoeste',   plan: 'alta',  status: 'next' },
    { time: '16:30', pet: 'Luna',  area: 'Lago Sul',   plan: 'equi',  status: 'next' },
  ],

  dogs: [
    { name: 'Thor',  breed: 'Border Collie · 4 anos',    tutor: 'Marina S.',    plan: 'alta',  area: 'Asa Sul',    note: 'Reativo a outros cães',     rating: 5.0 },
    { name: 'Bebel', breed: 'Poodle · 6 anos',           tutor: 'Ana Carolina', plan: 'manut', area: 'Asa Norte',  note: 'Adora água — evitar poças', rating: 4.9 },
    { name: 'Mel',   breed: 'Golden Retriever · 3 anos', tutor: 'Renato L.',    plan: 'equi',  area: 'Lago Norte', note: 'Medicação 12h',             rating: 4.8 },
    { name: 'Caju',  breed: 'Labrador · 2 anos',         tutor: 'Pedro M.',     plan: 'alta',  area: 'Sudoeste',   note: 'Filhote — energia alta',    rating: 5.0 },
    { name: 'Luna',  breed: 'Husky · 5 anos',            tutor: 'Júlia R.',     plan: 'equi',  area: 'Lago Sul',   note: 'Sensível ao calor',         rating: 4.7 },
    { name: 'Rex',   breed: 'Vira-lata · 8 anos',        tutor: 'Carlos T.',    plan: 'manut', area: 'Cruzeiro',   note: 'Idoso — ritmo lento',       rating: 4.9 },
  ],

  months: [
    { label: 'Fev', v: 2900, h: 55 },
    { label: 'Mar', v: 3100, h: 62 },
    { label: 'Abr', v: 3400, h: 70 },
    { label: 'Mai', v: 3700, h: 80 },
    { label: 'Jun', v: 3850, h: 90, active: true },
    { label: 'Jul', v: 4100, h: 100, projected: true },
  ],
};

const PLAN = {
  alta:  { cls: 'chip-alta',  label: 'Alta Energia' },
  equi:  { cls: 'chip-equi',  label: 'Equilíbrio'   },
  manut: { cls: 'chip-manut', label: 'Manutenção'   },
};

const TODAY_ICON = {
  done: '<i class="ph-bold ph-check"></i>',
  now:  '<i class="ph-fill ph-play"></i>',
  next: '<i class="ph ph-clock"></i>',
};
const TODAY_BTN = {
  done: { label: 'Ver relatório', action: 'view-report' },
  now:  { label: 'Concluir',      action: 'finish-walk' },
  next: { label: 'Iniciar',       action: 'start-walk'  },
};
const SLOT_STATE_LABEL = { completed: 'Concluído', running: 'Em curso', scheduled: 'Agendado' };
const MESES = ['jan','fev','mar','abr','mai','jun','jul','ago','set','out','nov','dez'];

const STATE = {
  weekOffset: 0,
  baseMonday: 15,
  baseMonth: 5,
  capacity: { used: 23, total: 30 },
};

const $  = (s, c = document) => c.querySelector(s);
const $$ = (s, c = document) => Array.from(c.querySelectorAll(s));

function toast(msg, ms = 2400) {
  const el = $('#toast'); if (!el) return;
  $('#toastMsg').textContent = msg;
  el.classList.add('show');
  clearTimeout(toast._t);
  toast._t = setTimeout(() => el.classList.remove('show'), ms);
}

function dayNumbersForOffset(offset) {
  const start = STATE.baseMonday + offset * 7;
  const wrap = n => ((n - 1 + 30) % 30) + 1;
  const nums = [0,1,2,3,4].map(i => wrap(start + i));
  return { nums, label: `${nums[0]} – ${nums[4]} ${MESES[STATE.baseMonth]}` };
}

/* ---------- RENDER ---------- */
function renderToday() {
  $('#todayList').innerHTML = DATA.today.map((w, i) => `
    <li class="today-item ${w.status}" data-index="${i}">
      <div class="ti-check ${w.status}">${TODAY_ICON[w.status]}</div>
      <div class="ti-time">${w.time}</div>
      <div class="ti-info">
        <strong>${w.pet}</strong>
        <span><i class="ph ph-map-pin"></i> ${w.area}</span>
      </div>
      <span class="plan-chip ${PLAN[w.plan].cls}">${PLAN[w.plan].label}</span>
      <button class="btn-ghost" data-action="${TODAY_BTN[w.status].action}" data-index="${i}">${TODAY_BTN[w.status].label}</button>
    </li>
  `).join('');
}

function renderAgenda() {
  const { nums, label } = dayNumbersForOffset(STATE.weekOffset);
  $('#weekLabel').textContent = (STATE.weekOffset === 0 ? 'Esta semana · ' : '') + label;

  let done = 0, scheduled = 0;
  $('#agendaGrid').innerHTML = DATA.agenda.map((day, i) => {
    const isToday = STATE.weekOffset === 0 && !!day.isToday;
    const slots = day.slots.map(s => {
      if (s.status === 'completed') done++;
      else if (s.status === 'scheduled') scheduled++;
      return `
        <div class="walk-slot ${s.status}" data-pet="${s.pet}" data-time="${s.time}">
          <div class="slot-head">
            <span class="slot-time">
              <span class="slot-status status-${s.status}"></span>
              ${s.time}
            </span>
            <span class="slot-state-tag ${s.status}">${SLOT_STATE_LABEL[s.status]}</span>
          </div>
          <div class="slot-pet"><i class="ph ph-paw-print"></i> ${s.pet}</div>
          <div class="slot-plan">${PLAN[s.plan].label}</div>
        </div>
      `;
    }).join('');
    return `
      <div class="day-col ${isToday ? 'today' : ''}">
        <div class="day-header">
          <span class="day-name">${day.name}</span>
          <span class="day-num">${nums[i]}</span>
        </div>
        <div class="day-body">
          ${slots}
          <button class="day-add-slot" data-action="add-slot" data-day="${day.name}">
            <i class="ph ph-plus"></i> Adicionar
          </button>
        </div>
      </div>
    `;
  }).join('');

  $('#sumDone').textContent = done;
  $('#sumScheduled').textContent = scheduled;
}

function renderDogs() {
  $('#dogsGrid').innerHTML = DATA.dogs.map(d => `
    <div class="dog-card" data-pet="${d.name}">
      <div class="dog-avatar"><i class="ph-duotone ph-dog"></i></div>
      <div class="dog-body">
        <div class="dog-top">
          <strong>${d.name}</strong>
          <span class="plan-chip ${PLAN[d.plan].cls}">${PLAN[d.plan].label}</span>
        </div>
        <span class="dog-breed">${d.breed}</span>
        <span class="dog-owner"><i class="ph ph-user"></i> Tutor: ${d.tutor}</span>
        <div class="dog-stats"><div><i class="ph ph-map-pin"></i> ${d.area}</div></div>
        <div class="dog-notes"><i class="ph-fill ph-warning"></i>${d.note}</div>
      </div>
      <div class="dog-rating">
        <i class="ph-fill ph-star star"></i>
        <small>${d.rating.toFixed(1)}</small>
      </div>
    </div>
  `).join('');
}

function renderMonths() {
  $('#monthsGrid').innerHTML = DATA.months.map(m => {
    const cls = `${m.active ? 'bar-active' : ''} ${m.projected ? 'bar-projected' : ''}`.trim();
    const wrapCls = m.active ? 'active-month' : '';
    return `
      <div class="month-bar-wrap ${wrapCls}">
        <div class="month-bar ${cls}" style="height:${m.h}%;"><span>R$${(m.v/1000).toFixed(1)}k</span></div>
        <small>${m.label}</small>
      </div>
    `;
  }).join('');
}

function renderReviewStars() {
  $$('.rev-stars[data-stars]').forEach(el => {
    const n = parseInt(el.dataset.stars, 10) || 5;
    el.innerHTML = Array.from({ length: n }).map(() => '<i class="ph-fill ph-star"></i>').join('');
  });
}

function renderProgressRing() {
  const ring = $('#progressRing');
  const label = $('#progressLabel');
  const remain = $('#progressRemain');
  if (!ring) return;
  const total = DATA.today.length;
  const done  = DATA.today.filter(t => t.status === 'done').length;
  const c   = 2 * Math.PI * 26;
  const pct = total ? done / total : 0;
  ring.setAttribute('stroke-dasharray', c.toFixed(2));
  ring.setAttribute('stroke-dashoffset', (c * (1 - pct)).toFixed(2));
  label.textContent = `${done}/${total}`;
  const r = total - done;
  remain.textContent = r === 0 ? 'Tudo concluído!' : `${r} passeio${r === 1 ? '' : 's'} restante${r === 1 ? '' : 's'}`;
}

function refreshCapacity() {
  const { used, total } = STATE.capacity;
  const pct = Math.min(100, Math.round((used / total) * 100));
  $('#capBar').style.width = pct + '%';
  $('#capText').innerHTML = `${used} de ${total} passeios · <strong>${pct}% ocupado</strong>`;
}
function refreshWeekSummary() {
  const { used, total } = STATE.capacity;
  $('#srWalks').textContent = `${used} / ${total}`;
  $('#srWalksBar').style.width = Math.min(100, (used / total) * 100) + '%';
}

/* ---------- INTERAÇÕES ---------- */
function setupDropdowns() {
  const avMenu  = $('#avatarMenu');
  const notMenu = $('#notifMenu');
  $('#avatarTrigger').addEventListener('click', e => {
    e.stopPropagation();
    notMenu.classList.remove('open');
    avMenu.classList.toggle('open');
  });
  $('#notifTrigger').addEventListener('click', e => {
    e.stopPropagation();
    avMenu.classList.remove('open');
    notMenu.classList.toggle('open');
  });
  $('#notifMarkRead').addEventListener('click', e => {
    e.stopPropagation();
    const b = $('#notifBadge'); if (b) b.remove();
    toast('Notificações marcadas como lidas.');
  });
  document.addEventListener('click', e => {
    if (!avMenu.contains(e.target))  avMenu.classList.remove('open');
    if (!notMenu.contains(e.target)) notMenu.classList.remove('open');
  });
}

function setupAreaChips() {
  $('#areaChips').addEventListener('click', e => {
    const chip = e.target.closest('.area-chip');
    if (!chip) return;
    const wasActive = chip.classList.contains('active');
    chip.classList.toggle('active');
    chip.classList.toggle('inactive');
    toast(`${chip.textContent.trim()} ${wasActive ? 'removida da' : 'adicionada à'} sua área de atuação.`);
  });
}

function setupWeekNav() {
  $$('.week-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      STATE.weekOffset += parseInt(btn.dataset.week, 10);
      renderAgenda();
    });
  });
  $('#weekTodayBtn').addEventListener('click', () => {
    STATE.weekOffset = 0;
    renderAgenda();
  });
}

function openModal({ title, desc, icon = 'ph-fill ph-paw-print', onConfirm }) {
  $('#modalTitle').textContent = title;
  $('#modalDesc').textContent  = desc;
  $('#modalIcon').innerHTML    = `<i class="${icon}"></i>`;
  const old = $('#modalConfirm');
  const clone = old.cloneNode(true);
  old.parentNode.replaceChild(clone, old);
  clone.addEventListener('click', () => {
    closeModal();
    if (typeof onConfirm === 'function') onConfirm();
  });
  $('#modal').classList.add('open');
}
function closeModal() { $('#modal').classList.remove('open'); }

function setupModal() {
  $('#modal').addEventListener('click', e => { if (e.target.id === 'modal') closeModal(); });
  document.addEventListener('keydown', e => { if (e.key === 'Escape') closeModal(); });
  $$('[data-action="modal-close"]').forEach(b => b.addEventListener('click', closeModal));
}

function startNext() {
  const idx = DATA.today.findIndex(t => t.status === 'now') !== -1
    ? DATA.today.findIndex(t => t.status === 'now')
    : DATA.today.findIndex(t => t.status === 'next');
  if (idx === -1) { toast('Nenhum passeio pendente.'); return; }
  const w = DATA.today[idx];
  openModal({
    title: `Iniciar passeio com ${w.pet}`,
    desc:  `Confirme o check-in às ${w.time} em ${w.area}. Plano ${PLAN[w.plan].label}.`,
    icon:  'ph-fill ph-play',
    onConfirm: () => {
      DATA.today[idx].status = 'now';
      renderToday(); renderProgressRing();
      toast(`Passeio com ${w.pet} iniciado.`);
    }
  });
}

function finishWalk(idx) {
  const w = DATA.today[idx];
  openModal({
    title: `Concluir passeio — ${w.pet}`,
    desc:  `Registrar o check-out e enviar relatório ao tutor?`,
    icon:  'ph-fill ph-check-circle',
    onConfirm: () => {
      DATA.today[idx].status = 'done';
      const nx = DATA.today.findIndex(t => t.status === 'next');
      if (nx !== -1) DATA.today[nx].status = 'now';
      renderToday(); renderProgressRing();
      toast(`Passeio com ${w.pet} concluído. Relatório enviado.`);
    }
  });
}

function startSpecific(idx) {
  const w = DATA.today[idx];
  const first = DATA.today.findIndex(t => t.status === 'next');
  if (idx !== first) { toast('Conclua o passeio em andamento antes de iniciar o próximo.'); return; }
  openModal({
    title: `Iniciar passeio com ${w.pet}`,
    desc:  `Check-in das ${w.time} em ${w.area}?`,
    icon:  'ph-fill ph-play',
    onConfirm: () => {
      DATA.today[idx].status = 'now';
      renderToday(); renderProgressRing();
      toast(`Passeio com ${w.pet} iniciado.`);
    }
  });
}

function viewReport(idx) {
  const w = DATA.today[idx];
  toast(`Abrindo relatório do passeio com ${w.pet} (${w.time}).`);
}

function setupActions() {
  document.addEventListener('click', e => {
    const toastBtn = e.target.closest('[data-toast]');
    if (toastBtn) { toast(toastBtn.dataset.toast); return; }

    const action = e.target.closest('[data-action]');
    if (!action) return;
    const name = action.dataset.action;
    const idx  = parseInt(action.dataset.index, 10);

    switch (name) {
      case 'start-next': startNext(); break;
      case 'finish-walk': finishWalk(idx); break;
      case 'start-walk':  startSpecific(idx); break;
      case 'view-report': viewReport(idx); break;
      case 'day-report':  toast('Compilando o relatório consolidado do dia…'); break;
      case 'new-walk':
        openModal({
          title: 'Agendar novo passeio',
          desc:  'Selecione pet, horário, plano e área para adicionar à sua agenda.',
          icon:  'ph-fill ph-calendar-plus',
          onConfirm: () => {
            STATE.capacity.used = Math.min(STATE.capacity.total, STATE.capacity.used + 1);
            refreshCapacity(); refreshWeekSummary();
            toast('Novo passeio adicionado à agenda.');
          },
        });
        break;
      case 'add-slot':
        openModal({
          title: `Adicionar passeio em ${action.dataset.day}`,
          desc:  'Defina horário, pet e plano para o novo slot.',
          icon:  'ph-fill ph-calendar-plus',
          onConfirm: () => toast(`Novo slot reservado em ${action.dataset.day}.`),
        });
        break;
      case 'edit-profile':
        openModal({
          title: 'Editar perfil profissional',
          desc:  'Atualize foto, bio, especialidades e dados de contato.',
          icon:  'ph-fill ph-user-circle',
          onConfirm: () => toast('Perfil atualizado com sucesso.'),
        });
        break;
      case 'add-cert':
        openModal({
          title: 'Adicionar nova certificação',
          desc:  'Faça upload do comprovante e selecione a categoria.',
          icon:  'ph-fill ph-certificate',
          onConfirm: () => toast('Certificação enviada para análise.'),
        });
        break;
    }
  });

  $('#dogsGrid').addEventListener('click', e => {
    const card = e.target.closest('.dog-card');
    if (!card) return;
    toast(`Abrindo ficha completa de ${card.dataset.pet}.`);
  });

  $('#agendaGrid').addEventListener('click', e => {
    const slot = e.target.closest('.walk-slot');
    if (!slot) return;
    toast(`Passeio com ${slot.dataset.pet} às ${slot.dataset.time}.`);
  });
}

function setupSearch() {
  const input = $('#globalSearch');
  if (!input) return;
  input.addEventListener('input', () => {
    const q = input.value.trim().toLowerCase();
    let matches = 0;
    $$('#dogsGrid .dog-card').forEach(c => {
      const hit = !q || c.textContent.toLowerCase().includes(q);
      c.style.display = hit ? '' : 'none';
      if (hit) matches++;
    });
    $$('#todayList .today-item').forEach(li => {
      li.style.display = !q || li.textContent.toLowerCase().includes(q) ? '' : 'none';
    });
    $$('#agendaGrid .walk-slot').forEach(s => {
      s.style.opacity = !q || s.textContent.toLowerCase().includes(q) ? '1' : '0.25';
    });
    if (q && matches === 0) toast(`Nenhum pet encontrado para "${input.value}".`);
  });
}

function setupNav() {
  $$('.header-nav .nav-link, .footer-links a').forEach(a => {
    a.addEventListener('click', e => {
      const href = a.getAttribute('href');
      if (!href || !href.startsWith('#') || href === '#') return;
      const target = $(href);
      if (!target) return;
      e.preventDefault();
      const y = target.getBoundingClientRect().top + window.scrollY - 84;
      window.scrollTo({ top: y, behavior: 'smooth' });
      $$('.header-nav .nav-link').forEach(n => n.classList.remove('active'));
      if (a.classList.contains('nav-link')) a.classList.add('active');
    });
  });

  const sections = ['agenda','dogs','earnings','achievements']
    .map(id => ({ id, el: document.getElementById(id) }))
    .filter(s => s.el);
  window.addEventListener('scroll', () => {
    const y = window.scrollY + 120;
    let current = null;
    for (const s of sections) if (s.el.offsetTop <= y) current = s.id;
    if (!current) return;
    $$('.header-nav .nav-link').forEach(n => {
      n.classList.toggle('active', n.getAttribute('href') === '#' + current);
    });
  }, { passive: true });
}

function init() {
  try { renderToday();         } catch (e) { console.error('renderToday:', e); }
  try { renderAgenda();        } catch (e) { console.error('renderAgenda:', e); }
  try { renderDogs();          } catch (e) { console.error('renderDogs:', e); }
  try { renderMonths();        } catch (e) { console.error('renderMonths:', e); }
  try { renderReviewStars();   } catch (e) { console.error('renderReviewStars:', e); }
  try { renderProgressRing();  } catch (e) { console.error('renderProgressRing:', e); }
  try { refreshCapacity();     } catch (e) { console.error('refreshCapacity:', e); }
  try { refreshWeekSummary();  } catch (e) { console.error('refreshWeekSummary:', e); }
  try { setupDropdowns();      } catch (e) { console.error('setupDropdowns:', e); }
  try { setupAreaChips();      } catch (e) { console.error('setupAreaChips:', e); }
  try { setupWeekNav();        } catch (e) { console.error('setupWeekNav:', e); }
  try { setupModal();          } catch (e) { console.error('setupModal:', e); }
  try { setupActions();        } catch (e) { console.error('setupActions:', e); }
  try { setupSearch();         } catch (e) { console.error('setupSearch:', e); }
  try { setupNav();            } catch (e) { console.error('setupNav:', e); }
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', init);
} else {
  init();
}
