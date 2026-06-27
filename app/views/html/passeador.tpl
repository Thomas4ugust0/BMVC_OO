<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>PETWAY - Passeador</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/@phosphor-icons/web@2.1.1"></script>
  <link rel="stylesheet" href="/css/passeador.css" />
  <link rel="icon" type="image/png" href="/assets/img/icon2.png">
</head>
<body>
  <header class="site-header">
    <div class="header-inner container">
      <div>
        <span></span>
      </div>
      <nav class="header-nav">
        <a class="nav-link active" href="#agenda"><i class="ph ph-calendar-blank"></i> AGENDA</a>
        <a class="nav-link" href="#dogs"><i class="ph ph-paw-print"></i> PETS</a>
        <a class="nav-link" href="#earnings"><i class="ph ph-currency-dollar"></i> GANHOS</a>
        <a class="nav-link" href="#achievements"><i class="ph ph-chart-bar"></i> RELATÓRIOS</a>
      </nav>
      <div class="header-search">
        <i class="ph ph-magnifying-glass ico"></i>
        <input type="text" placeholder="Buscar pets, tutores, áreas..." id="globalSearch" />
      </div>
      <button class="btn-new-project" data-action="new-walk"><i class="ph-bold ph-plus"></i> Novo Passeio</button>

      <div class="notif-menu" id="notifMenu">
        <button class="icon-btn" id="notifTrigger" title="Notificações">
          <i class="ph ph-bell"></i>
          <span class="badge-count" id="notifBadge">3</span>
        </button>
        <div class="notif-dropdown">
          <div class="notif-head">
            <strong>Notificações</strong>
            <small id="notifMarkRead">Marcar todas como lidas</small>
          </div>
          <div class="notif-item">
            <i class="ph-fill ph-warning-circle"></i>
            <div><strong>Bebel — observação do tutor</strong><span>Ana pediu rota mais curta hoje</span></div>
          </div>
          <div class="notif-item">
            <i class="ph-fill ph-star"></i>
            <div><strong>Nova avaliação de 5 estrelas</strong><span>Marina S. avaliou Thor — há 2h</span></div>
          </div>
          <div class="notif-item">
            <i class="ph-fill ph-calendar-check"></i>
            <div><strong>Novo agendamento confirmado</strong><span>Caju — quinta às 08:00</span></div>
          </div>
        </div>
      </div>

      <div class="avatar-menu" id="avatarMenu">
        <button class="avatar-trigger" id="avatarTrigger">
          <span class="avatar-bubble">{{username[:2].upper()}}</span>
          <span class="header-user-info">
            <span class="user-name">{{username}}</span>
            <span class="user-badge">PASSEADOR</span>
          </span>
          <i class="ph-bold ph-caret-down chevron"></i>
        </button>
        <div class="avatar-dropdown">
          <div class="dropdown-head">
            <span class="avatar-bubble">{{username[:2].upper()}}</span>
            <div><strong>{{username}}</strong><small>{{email}}</small></div>
          </div>
          <button class="dropdown-item" data-toast="Abrindo seu perfil profissional…"><i class="ph ph-user"></i> Meu Perfil</button>
          <button class="dropdown-item" data-toast="Exibindo avaliações dos tutores…"><i class="ph ph-star"></i> Avaliações</button>
          <button class="dropdown-item" data-toast="Abrindo configurações da conta…"><i class="ph ph-gear-six"></i> Configurações</button>
          <button class="dropdown-item" data-toast="Conectando à Central de Ajuda…"><i class="ph ph-question"></i> Ajuda</button>
          <div class="dropdown-divider"></div>
          <a href="/logout" class="dropdown-item danger" data-toast="Sessão encerrada com segurança."><i class="ph ph-sign-out"></i> Sair</a>
        </div>
      </div>
    </div>
  </header>

  <section class="hero-banner">
    <div class="container">
      <div class="hero-content">
        <img src="../assets/img/petway_logo.png" alt="PETWAY" class="logo-img">
          <p class="hero-eyebrow">✦ Área do Passeador</p>
      <div class="hero-dog-graphic">
  </section>

  <main class="container">
    <div class="main-layout">
      <div class="main-col">
        <div class="summary-row">
          <div class="summary-card"><div class="sc-icon" style="background:var(--primary-glow);color:var(--primary-dark);"><i class="ph ph-path"></i></div><strong>127 km</strong><span class="sc-label">Distância no mês</span><span class="sc-trend trend-up"><i class="ph-bold ph-trend-up"></i> +12%</span></div>
          <div class="summary-card"><div class="sc-icon" style="background:var(--primary-glow);color:var(--primary-dark);"><i class="ph ph-clock"></i></div><strong>48 h</strong><span class="sc-label">Horas trabalhadas</span><span class="sc-trend trend-up"><i class="ph-bold ph-trend-up"></i> +6h</span></div>
          <div class="summary-card"><div class="sc-icon" style="background:var(--primary-glow);color:var(--primary-dark);"><i class="ph ph-users"></i></div><strong>12</strong><span class="sc-label">Tutores ativos</span><span class="sc-trend trend-up"><i class="ph-bold ph-trend-up"></i> +2</span></div>
          <div class="summary-card"><div class="sc-icon" style="background:var(--primary-glow);color:var(--primary-dark);"><i class="ph ph-medal"></i></div><strong>98%</strong><span class="sc-label">Pontualidade</span><span class="sc-trend trend-down"><i class="ph-bold ph-trend-down"></i> -1%</span></div>
        </div>

        <section class="step-section" id="today">
          <div class="step-header">
            <span class="step-badge">Hoje · 17/06</span>
            <h2 class="step-title">Passeios de hoje</h2>
            <p class="step-desc">Sua rota do dia organizada cronologicamente. Toque em "concluir" para registrar o check-out de cada passeio.</p>
          </div>
          <ul class="today-list" id="todayList"></ul>
        </section>

        <section class="step-section" id="agenda">
          <div class="step-header">
            <span class="step-badge">Agenda Semanal</span>
            <h2 class="step-title">Sua semana de passeios</h2>
            <p class="step-desc">Visualize horários da semana, identifique slots livres e gerencie compromissos rapidamente.</p>
          </div>

          <div class="agenda-toolbar">
            <button class="week-btn" data-week="-1" aria-label="Semana anterior"><i class="ph-bold ph-caret-left"></i></button>
            <span class="week-label" id="weekLabel">Esta semana · 15 – 21 jun</span>
            <button class="week-btn" data-week="1" aria-label="Próxima semana"><i class="ph-bold ph-caret-right"></i></button>
            <button class="week-today-btn" id="weekTodayBtn">Hoje</button>
            <div class="week-summary">
              <span><i class="ph ph-check-circle" style="color:var(--success);"></i> <strong id="sumDone">8</strong> concluídos</span>
              <span><i class="ph ph-clock" style="color:var(--blue);"></i> <strong id="sumScheduled">9</strong> agendados</span>
              <span><i class="ph ph-plus-circle" style="color:var(--text-muted);"></i> <strong>3</strong> slots livres</span>
            </div>
          </div>

          <div class="agenda-grid" id="agendaGrid"></div>

          <div class="agenda-legend">
            <div class="leg-item"><span class="leg-dot dot-done"></span> Concluído</div>
            <div class="leg-item"><span class="leg-dot dot-running"></span> Em andamento</div>
            <div class="leg-item"><span class="leg-dot dot-scheduled"></span> Agendado</div>
            <div class="leg-item"><span class="leg-dot dot-absent"></span> Cancelado</div>
          </div>
        </section>

        <section class="step-section" id="dogs">
          <div class="step-header">
            <span class="step-badge">Meus Pets</span>
            <h2 class="step-title">Base de clientes</h2>
            <p class="step-desc">Os cães que você atende regularmente, com informações críticas para garantir segurança e qualidade.</p>
          </div>
          <div class="dogs-grid" id="dogsGrid"></div>
        </section>

        <section class="step-section" id="earnings">
          <div class="step-header">
            <span class="step-badge">Rendimentos</span>
            <h2 class="step-title">Ganhos e pagamentos</h2>
            <p class="step-desc">Acompanhe sua evolução financeira, recebimentos pendentes e projeções.</p>
          </div>
          <div class="finance-kpi">
            <div class="fin-card"><div class="fin-icon"><i class="ph ph-currency-dollar"></i></div><div><strong>R$ 3.850</strong><span>Total — Junho/26</span></div></div>
            <div class="fin-card"><div class="fin-icon fin-green"><i class="ph-bold ph-trend-up"></i></div><div><strong>R$ 4.100</strong><span>Projeção Julho</span></div></div>
            <div class="fin-card"><div class="fin-icon fin-blue"><i class="ph ph-calendar-dots"></i></div><div><strong>R$ 145</strong><span>A receber</span></div></div>
            <div class="fin-card"><div class="fin-icon fin-amber"><i class="ph ph-wallet"></i></div><div><strong>R$ 950</strong><span>Esta semana</span></div></div>
          </div>
          <div class="history-months">
            <div class="history-head"><h4>Evolução mensal</h4><small>Últimos 6 meses</small></div>
            <div class="months-grid" id="monthsGrid"></div>
            <p class="chart-note">Crescimento de <strong>+32%</strong> nos últimos 6 meses</p>
          </div>
        </section>
        <section class="step-section" id="profile">
          <div class="step-header">
            <span class="step-badge">Perfil Profissional</span>
            <h2 class="step-title">Sobre você</h2>
            <p class="step-desc">Edite seu perfil público, gerencie certificações, áreas de atuação e veja avaliações dos tutores.</p>
          </div>
          <div class="profile-grid">
            <div class="profile-card">
              <div class="profile-avatar">{{username[0].upper()}}</div>
              <div class="profile-info">
                <h3>{{username}}</h3>
                <div class="profile-rating"><i class="ph-fill ph-star"></i><strong>4.9</strong><small>(127 avaliações)</small></div>
                <div class="profile-location"><i class="ph ph-map-pin"></i> Brasília · DF</div>
                <div class="profile-badges">
                  <span class="verified-badge"><i class="ph-fill ph-shield-check"></i> Verificado</span>
                  <span class="verified-badge"><i class="ph-fill ph-medal"></i> Pro</span>
                </div>
                <div class="profile-capacity">
                  <span class="cap-label">Capacidade semanal</span>
                  <div class="cap-bar-wrap"><div class="cap-bar" id="capBar" style="width:76%;"></div></div>
                  <span class="cap-text" id="capText">23 de 30 passeios · <strong>76% ocupado</strong></span>
                </div>
                <button class="btn-edit-profile" data-action="edit-profile"><i class="ph ph-pencil-simple"></i> Editar perfil</button>
              </div>
            </div>
            <div class="reviews-block">
              <h4>Avaliações recentes dos tutores</h4>
              <div class="review-card"><div class="review-top"><div class="rev-avatar">M</div><div><strong>Marina S.</strong><small>Há 2 dias</small></div><div class="rev-stars" data-stars="5"></div></div><p>"Lucas é incrível com o Thor. Sempre pontual e envia fotos lindas do passeio. Recomendo demais!"</p></div>
              <div class="review-card"><div class="review-top"><div class="rev-avatar">A</div><div><strong>Ana Carolina</strong><small>Há 1 semana</small></div><div class="rev-stars" data-stars="5"></div></div><p>"Profissional excepcional. A Bebel ama os passeios e volta super relaxada. Confiança total."</p></div>
              <div class="review-card"><div class="review-top"><div class="rev-avatar">P</div><div><strong>Pedro M.</strong><small>Há 2 semanas</small></div><div class="rev-stars" data-stars="5"></div></div><p>"Atencioso, carinhoso e responsável. O Caju (filhote) está aprendendo muito nos passeios."</p></div>
            </div>
          </div>
          <div class="certs-block">
            <h4>Especialidades e certificações</h4>
            <div class="certs-grid">
              <div class="cert-card active"><i class="ph-fill ph-shield-check"></i><strong>RCP Pets</strong><small>Vigente</small></div>
              <div class="cert-card active"><i class="ph-fill ph-medal"></i><strong>Adestrador Cert.</strong><small>Cinotecnia</small></div>
              <div class="cert-card active"><i class="ph-fill ph-first-aid-kit"></i><strong>Primeiros Socorros</strong><small>Veterinário</small></div>
              <div class="cert-card inactive"><i class="ph ph-brain"></i><strong>Comportamento Canino</strong><small>Não iniciado</small></div>
              <div class="cert-card inactive" data-action="add-cert"><i class="ph ph-plus-circle"></i><strong>Adicionar</strong><small>Nova certificação</small></div>
            </div>
          </div>
          <div class="area-block">
            <h4><i class="ph ph-map-pin"></i> Área de atuação</h4>
            <div class="area-chips" id="areaChips">
              <button class="area-chip active">Asa Sul</button>
              <button class="area-chip active">Asa Norte</button>
              <button class="area-chip active">Lago Sul</button>
              <button class="area-chip active">Lago Norte</button>
              <button class="area-chip active">Sudoeste</button>
              <button class="area-chip active">Cruzeiro</button>
              <button class="area-chip inactive">Noroeste</button>
              <button class="area-chip inactive">Park Way</button>
            </div>
          </div>
        </section>
      </div>

      <aside class="sidebar">
        <div class="sidebar-sticky">
          <div class="sidebar-card next-walk-card">
            <div class="sidebar-header"><div class="sidebar-live-dot"></div><h4>Próximo passeio</h4></div>
            <div class="next-walk-info">
              <div class="nw-time">10:30</div>
              <div class="nw-details">
                <strong>Bebel · Poodle</strong>
                <span><i class="ph ph-user"></i> Ana Carolina</span>
                <span><i class="ph ph-map-pin"></i> Asa Norte · SQN 410</span>
              </div>
            </div>
            <div class="nw-plan"><span class="plan-chip chip-manut">Manutenção · 30 min</span></div>
            <button class="btn-primary btn-full" data-action="start-next"><i class="ph-fill ph-play"></i> INICIAR PASSEIO</button>
            <button class="btn-ghost btn-full" style="margin-top:8px;" data-toast="Abrindo observações do tutor..."><i class="ph ph-file-text"></i> Observações do tutor</button>
          </div>
          <div class="sidebar-card">
            <div class="sidebar-header"><h4>Alertas</h4></div>
            <div class="alert-item alert-warn"><i class="ph-fill ph-warning"></i><span><strong>Bebel</strong> é sensível a sons altos. Evite rota próxima à obra na SQN 412.</span></div>
            <div class="alert-item alert-info"><i class="ph-fill ph-info"></i><span><strong>Mel</strong> precisa de medicação às 12h. Tutora enviou lembrete.</span></div>
          </div>
          <div class="sidebar-card">
            <div class="sidebar-header"><h4>Resumo da semana</h4></div>
            <div class="week-num-row"><span>Passeios</span><strong id="srWalks">17 / 23</strong></div>
            <div class="week-progress"><div class="week-prog-bar" id="srWalksBar" style="width:74%;"></div></div>
            <div class="week-num-row"><span>Ganhos</span><strong>R$ 1.180</strong></div>
            <div class="week-progress"><div class="week-prog-bar" style="width:62%;"></div></div>
            <div class="week-num-row"><span>Avaliação</span><strong><span style="display:inline-flex;align-items:center;gap:4px;">4.9 <i class="ph-fill ph-star" style="color:var(--amber);font-size:12px;"></i></span></strong></div>
            <div class="week-progress"><div class="week-prog-bar" style="width:98%;"></div></div>
          </div>
        </div>
      </aside>
    </div>
  </main>

  <div class="modal-overlay" id="modal">
    <div class="modal-box">
      <div class="modal-icon" id="modalIcon"><i class="ph-fill ph-paw-print"></i></div>
      <h2 id="modalTitle">Iniciar passeio</h2>
      <p id="modalDesc">Confirme para começar o check-in deste passeio.</p>
      <div class="modal-actions">
        <button class="btn-ghost" data-action="modal-close">Cancelar</button>
        <button class="btn-primary" id="modalConfirm">Confirmar</button>
      </div>
    </div>
  </div>

  <div class="toast" id="toast"><i class="ph-fill ph-check-circle"></i><span id="toastMsg">Pronto.</span></div>

<!-- ========== FOOTER ========== -->
  <footer class="site-footer">
    <div class="container footer-inner">
      <div class="footer-brand">
        <img src="../assets/img/petway_logo.png" alt="PETWAY" class="logo-img">        
      </div>
      <div class="footer-links">
        <h5>Plataforma</h5>
        <a href="#">Como Funciona</a>
        <a href="#">Seja um Passeador</a>
        <a href="#">Planos e Preços</a>
      </div>
      <div class="footer-links">
        <h5>Suporte</h5>
        <a href="#">Central de Ajuda</a>
        <a href="#">Chat ao Vivo</a>
        <a href="#">Política de Cancelamento</a>
        <a href="#">Termos de Uso</a>
      </div>
      <div class="footer-links">
        <h5>Sobre</h5>
        <a href="#">Nossa Missão</a>
        <a href="#">Segurança</a>
        <a href="#">Blog Petway</a>
        <a href="#">Contato</a>
      </div>
    </div>
    <div class="footer-bottom">
      <div class="container">
        <p>© 2026 PETWAY Tecnologia Ltda. · Todos os direitos reservados · Brasília – DF</p>
        <p>CNPJ: 00.000.000/0001-00 · contato@petway.com.br</p>
      </div>
    </div>
  </footer>

  <script src="/js/passeador.js"></script>
</body>
</html>
