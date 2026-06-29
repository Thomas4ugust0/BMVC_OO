<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>PETWAY - Tutor</title>
  <script src="https://unpkg.com/@phosphor-icons/web"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/css/cliente.css" />
  <link rel="icon" type="image/png" href="/assets/img/icon2.png">
</head>
<body>

  <!-- ========== HEADER ========== -->
  <header class="site-header">
    <div class="header-inner container">
      <nav class="header-nav">
        <a href="#step-4" class="nav-link">Como Funciona</a>
        <a href="#step-1" class="nav-link">Passeadores</a>
        <a href="#step-2" class="nav-link">Planos</a>
      </nav>
      <div class="header-user">
        <div class="avatar-bubble">
          <span class="avatar-initial">{{usuario.nome[:2].upper()}}</span>
        </div>
        <span class="user-name">{{usuario.nome}}</span>
        <span class="user-badge">Tutor</span>
      </div>
      <a href="/logout" class="nav-link">Sair <i class="ph ph-sign-out"></i></a>
    </div>
  </header>

  <!-- ========== HERO BANNER ========== -->
  <section class="hero-banner">
    <div class="container">
      <div class="hero-content">
        <img src="../assets/img/petway_logo.png" alt="PETWAY" class="logo-img">
          <p class="hero-eyebrow">✦ Área do Cliente</p>
      <div class="hero-dog-graphic">

  </section>

  <!-- ========== PROGRESS BAR ========== -->
<div class="progress-strip">
  <div class="container">
    <div class="progress-steps">
      <div class="pstep active" data-step="1">
        <div class="pstep-num">
          <span>1</span>
          <i class="ph-bold ph-check-fat" style="color:#0c0906"></i>
        </div>
        <span>Passeador</span>
      </div>
      
      <div class="pstep-line"></div>
      
      <div class="pstep" data-step="2">
        <div class="pstep-num">
          <span>2</span>
          <i class="ph-bold ph-check-fat" style="color:#0c0906"></i>
        </div>
        <span>Plano</span>
      </div>
      
      <div class="pstep-line"></div>
      
      <div class="pstep" data-step="3">
        <div class="pstep-num">
          <span>3</span>
          <i class="ph-bold ph-check-fat" style="color:#0c0906"></i>
        </div>
        <span>Agendamento</span>
      </div>
      
      <div class="pstep-line"></div>
      
      <div class="pstep" data-step="4">
        <div class="pstep-num">
          <span>4</span>
          <i class="ph-bold ph-check-fat" style="color:#0c0906"></i>
        </div>
        <span>Confirmação</span>
      </div>
    </div>
  </div>
</div>

  <!-- ========== MAIN LAYOUT ========== -->
  <main class="main-layout container">
    <div class="main-col">

      <!-- ===== STEP 1: WALKER SELECTION ===== -->
      <section class="step-section" id="step-1">
        <div class="step-header">
          <div class="step-badge">Passo 1</div>
          <h2 class="step-title">Escolha seu Passeador de Confiança</h2>
          <p class="step-desc">Conheça nossos profissionais verificados na sua região. Todos passaram por treinamento e avaliação de segurança.</p>
        </div>

        <div class="filter-row">
          <span class="filter-label">Bairro:</span>
          <select class="select-elegant">
            <option>Plano Piloto</option>
            <option>Águas Claras</option>
            <option>Sudoeste</option>
            <option>Asa Norte</option>
            <option>Asa Sul</option>
          </select>
          <span class="filter-label">Especialidade:</span>
          <select class="select-elegant">
            <option>Todas</option>
            <option>Alta Energia</option>
            <option>Raças Pequenas</option>
            <option>Filhotes</option>
          </select>
        </div>

        <div class="walkers-grid">

          <!-- Walker 1 -->
          <input type="radio" name="walker" id="w1" value="lucas" class="sr-only" />
          <label class="walker-card" for="w1" onclick="selectWalker('Lucas Ferreira', '4.9', 'lucas')">
            <div class="wc-header">
              <div class="wc-avatar" style="background: linear-gradient(135deg,#c59961,#a07840);">
                <span>LF</span>
              </div>
              <div class="wc-meta">
                <h3>Lucas Ferreira</h3>
                <div class="wc-rating">
                  <span class="stars"><div class="stars-group" data-rating="5"></div></span>
                  <strong>4.9</strong>
                  <small>(187 avaliações)</small>
                </div>
                <div class="wc-location"><i class="ph ph-map-pin-area"></i> Asa Sul · Plano Piloto</div>
              </div>
              <div class="wc-check"><span>✓</span></div>
            </div>
            <div class="wc-tags">
              <span class="tag tag-energy">Especialista em Alta Energia</span>
              <span class="tag">Golden Retriever</span>
              <span class="tag">Husky</span>
            </div>
            <div class="wc-stats">
              <div class="wc-stat">
                <strong>1.240</strong>
                <small>Passeios</small>
              </div>
              <div class="wc-stat">
                <strong>3 anos</strong>
                <small>Experiência</small>
              </div>
              <div class="wc-stat">
                <strong>8</strong>
                <small>Cães ativos</small>
              </div>
              <div class="wc-stat capacity">
                <strong>2 vagas</strong>
                <small>Disponíveis</small>
              </div>
            </div>
            <div class="wc-bio">"Transformo rotina em alegria. Cada passeio é tratado com seriedade e muito carinho."</div>
            <div class="wc-footer">
              <span class="verified-badge"><i class="ph ph-seal-check"></i> Verificado</span>
              <span class="verified-badge"><i class="ph ph-notepad"></i> Antecedentes OK</span>
              <span class="verified-badge"><i class="ph ph-dog"></i> Adestrador</span>
            </div>
          </label>
          <!-- Walker 2 -->
          <input type="radio" name="walker" id="w2" value="ana" class="sr-only" />
          <label class="walker-card" for="w2" onclick="selectWalker('Ana Carolina Lima', '5.0', 'ana')">
            <div class="wc-header">
              <div class="wc-avatar" style="background: linear-gradient(135deg,#9b6e3a,#c59961);">
                <span>AC</span>
              </div>
              <div class="wc-meta">
                <h3>Ana Carolina Lima</h3>
                <div class="wc-rating">
                  <span class="stars"><div class="stars-group" data-rating="5"></div></span>
                  <strong>5.0</strong>
                  <small>(214 avaliações)</small>
                </div>
                <div class="wc-location"><i class="ph ph-map-pin-area"></i> Águas Claras · Sudoeste</div>
              </div>
              <div class="wc-check"><span>✓</span></div>
            </div>
            <div class="wc-tags">
              <span class="tag tag-small">Especialista em Raças Pequenas</span>
              <span class="tag">Filhotes</span>
              <span class="tag">Idosos</span>
            </div>
            <div class="wc-stats">
              <div class="wc-stat">
                <strong>876</strong>
                <small>Passeios</small>
              </div>
              <div class="wc-stat">
                <strong>2 anos</strong>
                <small>Experiência</small>
              </div>
              <div class="wc-stat">
                <strong>6</strong>
                <small>Cães ativos</small>
              </div>
              <div class="wc-stat capacity">
                <strong>4 vagas</strong>
                <small>Disponíveis</small>
              </div>
            </div>
            <div class="wc-bio">"Cuido do seu pet como se fosse meu. Fotos e atualizações em tempo real em todos os passeios."</div>
            <div class="wc-footer">
              <span class="verified-badge"><i class="ph ph-seal-check"></i> Verificada</span>
              <span class="verified-badge"><i class="ph ph-notepad"></i> Antecedentes OK</span>
              <span class="verified-badge"><i class="ph ph-graduation-cap"></i> Certificada</span>
            </div>
          </label>

          <!-- Walker 3 -->
          <input type="radio" name="walker" id="w3" value="rafael" class="sr-only" />
          <label class="walker-card" for="w3" onclick="selectWalker('Rafael Moura', '4.8', 'rafael')">
            <div class="wc-header">
              <div class="wc-avatar" style="background: linear-gradient(135deg,#5a7a4a,#7aab5e);">
                <span>RM</span>
              </div>
              <div class="wc-meta">
                <h3>Rafael Moura</h3>
                <div class="wc-rating">
                  <span class="stars"><div class="stars-group" data-rating="5"></div></span>
                  <strong>4.8</strong>
                  <small>(122 avaliações)</small>
                </div>
                <div class="wc-location"><i class="ph ph-map-pin-area"></i> Asa Norte · Lago Norte</div>
              </div>
              <div class="wc-check"><span>✓</span></div>
            </div>
            <div class="wc-tags">
              <span class="tag tag-guard">Raças de Guarda</span>
              <span class="tag">Border Collie</span>
              <span class="tag">Pastor Alemão</span>
            </div>
            <div class="wc-stats">
              <div class="wc-stat">
                <strong>654</strong>
                <small>Passeios</small>
              </div>
              <div class="wc-stat">
                <strong>1.5 anos</strong>
                <small>Experiência</small>
              </div>
              <div class="wc-stat">
                <strong>5</strong>
                <small>Cães ativos</small>
              </div>
              <div class="wc-stat capacity">
                <strong>5 vagas</strong>
                <small>Disponíveis</small>
              </div>
            </div>
            <div class="wc-bio">"Especializado em raças inteligentes e de trabalho. Passeios estruturados com foco em obediência."</div>
            <div class="wc-footer">
              <span class="verified-badge"><i class="ph ph-seal-check"></i> Verificado</span>
              <span class="verified-badge"><i class="ph ph-notepad"></i>Antecedentes OK</span>
              <span class="verified-badge"><i class="ph ph-dog"></i> Adestrador</span>
            </div>
          </label>

        </div>
      </section>

      <!-- ===== STEP 2: PLAN SELECTION ===== -->
      <section class="step-section" id="step-2">
        <div class="step-header">
          <div class="step-badge">Passo 2</div>
          <h2 class="step-title">Defina a Rotina Ideal</h2>
          <p class="step-desc">Planos mensais com renovação automática. Quanto mais frequente, menor o custo por passeio — e mais feliz o seu pet.</p>
        </div>

        <div class="plans-grid">

          <!-- Plan 1: Manutenção -->
          <input type="radio" name="plan" id="p1" value="manutencao" class="sr-only" />
          <label class="plan-card plan-best" for="p1" onclick="selectPlan('Plano Manutenção', 400)">
            <div class="plan-top">
              <div class="plan-icon"><i class="ph ph-plant"></i></div>
              <h3 class="plan-name">Manutenção</h3>
              <p class="plan-freq">2× por semana</p>
            </div>
            <div class="plan-price">
              <span class="price-value">R$ 400</span>
              <span class="price-period">/mês</span>
            </div>
            <div class="price-unit">R$ 50 por passeio</div>
            <ul class="plan-benefits">
              <li>✓ Dias flexíveis (você escolhe)</li>
              <li>✓ Relatório básico pós-passeio</li>
              <li>✓ Confirmação por WhatsApp</li>
              <li>✓ Passeador fixo dedicado</li>
            </ul>
            <div class="plan-cta">Escolher</div>
          </label>

          <!-- Plan 2: Equilíbrio (popular) -->
          <input type="radio" name="plan" id="p2" value="equilibrio" class="sr-only" />
          <label class="plan-card plan-best" for="p2" onclick="selectPlan('Plano Equilíbrio', 540)">
            <div class="plan-badge-dark">Mais Escolhido</div>
            <div class="plan-top">
              <div class="plan-icon"><i class="ph ph-scales"></i></div>
              <h3 class="plan-name">Equilíbrio</h3>
              <p class="plan-freq">3× por semana</p>
            </div>
            <div class="plan-price">
              <span class="price-value">R$ 540</span>
              <span class="price-period">/mês</span>
            </div>
            <div class="price-unit">R$ 45 por passeio</div>
            <ul class="plan-benefits">
              <li>✓ Dias fixos na semana</li>
              <li>✓ Fotos do passeio em tempo real</li>
              <li>✓ Relatório detalhado</li>
              <li>✓ Confirmação por WhatsApp</li>
              <li>✓ Passeador fixo dedicado</li>
            </ul>
            <div class="plan-cta">Escolher</div>
          </label>

          <!-- Plan 3: Alta Energia (best value) -->
          <input type="radio" name="plan" id="p3" value="alta-energia" class="sr-only" />
          <label class="plan-card plan-best" for="p3" onclick="selectPlan('Plano Alta Energia', 700)">
            <div class="plan-badge-gold">Melhor Custo-Benefício</div>
            <div class="plan-top">
              <div class="plan-icon"><i class="ph ph-lightning"></i></div>
              <h3 class="plan-name">Alta Energia</h3>
              <p class="plan-freq">5× por semana (Seg–Sex)</p>
            </div>
            <div class="plan-price">
              <span class="price-value">R$ 700</span>
              <span class="price-period">/mês</span>
            </div>
            <div class="price-unit">Apenas R$ 35 por passeio</div>
            <ul class="plan-benefits">
              <li>✓ Rotina diária Seg–Sex</li>
              <li>✓ Vídeo diário do passeio</li>
              <li>✓ Relatório completo de saúde e humor</li>
              <li>✓ Prioridade de atendimento</li>
              <li>✓ Passeador fixo dedicado</li>
            </ul>
            <div class="plan-cta">Escolher</div>
          </label>

        </div>

        <div class="plan-compare-note">
          <span><i class="ph-bold ph-shield-check"></i></span> Todos os planos incluem seguro de responsabilidade civil, rastreamento GPS do passeador e suporte via chat 24h.
        </div>
      </section>

      <!-- ===== STEP 3: SCHEDULING ===== -->
      <section class="step-section" id="step-3">
        <div class="step-header">
          <div class="step-badge">Passo 3</div>
          <h2 class="step-title">Agendamento e Assinatura</h2>
          <p class="step-desc">Defina o horário padrão e conclua sua assinatura. O restante acontece automaticamente.</p>
        </div>

        <div class="scheduling-grid">
          <div class="schedule-block">
            <h4><i class="ph-bold ph-paw-print"></i> Seus Pets</h4>
            <div class="pet-selector">
              % if pets:
                  % for pet in pets:
                  <input type="radio" name="pet" id="pet_radio_{{pet.id}}" value="{{pet.id}}" class="sr-only" />
                  
                  <label class="pet-chip" for="pet_radio_{{pet.id}}">
                      <i class="ph-bold ph-dog"></i> {{pet.nome}}
                  </label>
                  % end
              % end
             <a href="#cadastrar-pet" class="pet-chip pet-add" style="text-decoration: none; display: inline-block;" onclick="document.getElementById('form-novo-pet').style.display='block'">
                  <i class="ph ph-pencil-line"></i> Alterar
              </a>
              
            </div>
          </div>

          <div class="schedule-block">
            <h4><i class="ph-bold ph-alarm"></i> Horário Padrão dos Passeios</h4>
            <select class="select-elegant select-large" id="horario" onchange="updateSummary()">
              <option value="">Selecione o horário</option>
              <option value="manha"><i class="ph-bold ph-sun"></i> Manhã (06h–09h)</option>
              <option value="tarde"><i class="ph-bold ph-sun-horizon"></i> Tarde (12h–15h)</option>
              <option value="noite"><i class="ph-bold ph-moon"></i> Noite (17h–20h)</option>
            </select>
            <p class="field-hint">O sistema gerará automaticamente a agenda do seu passeador com base nesta preferência.</p>
          </div>

          <div class="schedule-block">
            <h4><i class="ph-bold ph-map-pin"></i> Ponto de Encontro</h4>
            <input type="text" class="input-elegant" placeholder="Endereço de saída (ex: Rua das Acácias, 45)" />
            <p class="field-hint">Seu passeador chegará neste endereço nos dias contratados.</p>
          </div>

          <div class="schedule-block">
            <h4><i class="ph-bold ph-note"></i> Observações Especiais</h4>
            <textarea class="textarea-elegant" rows="3" placeholder="Informe características especiais do seu pet: reatividade, medos, alimentação durante o passeio..."></textarea>
          </div>
        </div>
      

      <!-- ===== STEP 4: POST-SUBSCRIPTION FEATURES ===== -->
      <section class="step-section" id="step-4">


        <!-- Activity Timeline mockup -->
        <div class="activity-section">
          <h3 class="activity-title">Histórico Recente</h3>
          <div id="cadastrar-pet"  class="timeline">
            <div class="timeline-item completed">
              <div class="tl-dot"></div>
              <div class="tl-content">
                <div class="tl-header">
                  <span class="tl-label completed-label"><i class="ph-bold ph-check"></i> Concluído</span>
                  <span class="tl-date">Hoje, 07:30</span>
                </div>
                <p class="tl-desc">Passeio com <strong>Lucas Ferreira</strong> · 45 min · 3,2 km · Parque Olhos D'Água</p>
                <div class="tl-rating"><div class="stars-group" data-rating="5"></div> <small>Você avaliou: Excelente!</small></div>
              </div>
            </div>
            <div class="timeline-item upcoming">
              <div class="tl-dot"></div>
              <div class="tl-content">
                <div class="tl-header">
                  <span class="tl-label upcoming-label"><i class="ph-bold ph-calendar-blank"></i> Agendado</span>
                  <span class="tl-date">Amanhã, 07:30</span>
                </div>
                <p class="tl-desc">Passeio com <strong>Lucas Ferreira</strong> · Plano Alta Energia · Rota habitual</p>
              </div>
            </div>
            <div class="timeline-item upcoming">
              <div class="tl-dot"></div>
              <div class="tl-content">
                <div class="tl-header">
                  <span class="tl-label upcoming-label"><i class="ph-bold ph-calendar-blank"></i> Agendado</span>
                  <span class="tl-date">Qua, 07:30</span>
                </div>
                <p class="tl-desc">Passeio com <strong>Lucas Ferreira</strong> · Plano Alta Energia · Rota habitual</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Dog Profiles -->
<div class="dogs-section">
          <div class="dogs-header">
            <h3>Meus Pets</h3>
            <button class="btn-add-pet" onclick="document.getElementById('form-novo-pet').style.display='block'">+ Adicionar Pet</button>
          </div>

          <div id="form-novo-pet" style="display: none; margin-bottom: 20px; padding: 15px; border: 1px solid #ccc; border-radius: 8px;">
              <h4>Cadastrar Novo Pet</h4>
              <form action="/adicionar_pet" method="POST" style="display: flex; gap: 10px; align-items: center;">
                  <input class="select-elegant" type="text" name="nome" placeholder="Nome" required style="min-width: 0px !important; width: 500px; padding: 8px 10px;">
                  <input class="select-elegant" type="text" name="raca" placeholder="Raça (ex: Golden)" required style="padding: 8px;">
                  <select class="select-elegant" name="sexo" required style="padding: 8px; min-width: 0px !important; width: 500px;">
                      <option value="Macho">Macho</option>
                      <option value="Fêmea">Fêmea</option>
                  </select>
                  <button class="btn-confirm" type="submit" style="width: 100px; height: 30px; font-size: 10px; color: white; border: none;">Salvar Pet</button>
                  <button class="btn-confirm tl-desc" type="button" onclick="document.getElementById('form-novo-pet').style.display='none'" style="height: 30px; padding:10px; background: white; border: none; font-size: 10px" margin="10px">Cancelar</button>
              </form>
          </div>

          <div class="dogs-grid">
            
            % if pets:
                % for pet in pets:
                <div class="dog-profile-card">
                  <div class="dog-avatar"><i class="ph-fill ph-dog"></i></div>
                  <div class="dog-info">
                    <strong>{{ pet.nome }}</strong>
                    <span>{{ pet.raca }} · {{ pet.sexo }}</span>
                  </div>
                  
                  <form action="/excluir_pet/{{ pet.id }}" method="POST" style="margin-left: auto;">
                        <button class="tl-desc" type="submit" style="color: #d9534f; background: none; border: none; cursor: pointer; font-size: 12px; padding: 5px;">
                          <i class="ph-fill ph-trash"></i> Remover
                        </button>
                  </form>
                </div>
                % end
            % else:
                <p style="color: #666; font-style: italic;">Nenhum pet cadastrado ainda. Adicione seu primeiro pet!</p>
            % end
            
          </div>
        </div>

        <!-- Payment & Billing -->
        <div class="billing-section">
          <h3><i class="ph-bold ph-credit-card"></i> Pagamento e Faturamento</h3>
          <div class="billing-grid">
            <div class="billing-card">
              <div class="bill-icon"><i class="ph-bold ph-credit-card"></i></div>
              <div>
                <strong>Cartão de Crédito</strong>
                <p>Visa •••• •••• •••• 4242</p>
                <small>Próxima cobrança: 01/08/2025</small>
              </div>
              <button class="btn-link">Alterar</button>
            </div>
            <div class="billing-card">
              <div class="bill-icon"><i class="ph-bold ph-repeat"></i></div>
              <div>
                <strong>Renovação Automática</strong>
                <p>Ativa · Mensal</p>
                <small>Você será notificado 3 dias antes</small>
              </div>
              <button class="btn-link">Gerenciar</button>
            </div>
            <div class="billing-card">
              <div class="bill-icon"><i class="ph-bold ph-invoice"></i></div>
              <div>
                <strong>Histórico de Cobranças</strong>
                <p>Julho 2025 · R$ 700,00 <i class="ph-bold ph-check"></i></p>
                <small>Junho 2025 · R$ 700,00 <i class="ph-bold ph-check"></i></small>
              </div>
              <button class="btn-link">Ver Todos</button>
            </div>
          </div>
        </div>

      </section>

    </div>

    <!-- ========== SIDEBAR: LIVE SUMMARY ========== -->
    <aside class="sidebar">
      <div class="sidebar-sticky">
        <div class="sidebar-card">
          <div class="step-badge">Passo 4</div>
          <div class="sidebar-header">
            <h4><i class="ph ph-shopping-bag-open"></i> Resumo da Assinatura
            </h4>
          </div>

          <div class="sidebar-section">
            <p class="sb-label">Passeador</p>
            <div class="sb-value" id="sb-walker">
              <div class="sb-placeholder">Nenhum selecionado</div>
            </div>
          </div>

          <div class="sidebar-section">
            <p class="sb-label">Plano</p>
            <div class="sb-value" id="sb-plan">
              <div class="sb-placeholder">Nenhum selecionado</div>
            </div>
          </div>

          <div class="sidebar-section">
            <p class="sb-label">Horário</p>
            <div class="sb-value" id="sb-time">
              <div class="sb-placeholder">Não definido</div>
            </div>
          </div>

          <div class="sidebar-divider"></div>

          <div class="sidebar-total">
            <span>Total/mês</span>
            <strong style="color: #0c0906;" id="sb-price">R$ —</strong>
          </div>

          <button class="btn-confirm btn-sidebar" onclick="confirmSubscription()">
            Confirmar Assinatura →
          </button>
        </div>

  </main>
  <section class="faq-section">
    <div class="container faq-inner">
      <div class="step-header">
          <h2 class="step-title">Acompanhamento em Tempo Real</h2>
          <p class="step-desc">Tudo que você precisa para monitorar e gerenciar a rotina do seu pet, direto na plataforma.</p>
        </div>

        <div class="features-grid">
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-map-pin"></i></div>
            <h4>Rastreamento ao Vivo</h4>
            <p>Veja onde seu pet está durante o passeio. Receba notificação quando sair e quando voltar.</p>
          </div>
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-camera"></i></div>
            <h4>Fotos & Vídeos</h4>
            <p>Receba registros do passeio diretamente no app. Memórias do dia a dia do seu melhor amigo.</p>
          </div>
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-notebook"></i></div>
            <h4>Relatório de Saúde</h4>
            <p>Distância percorrida, necessidades fisiológicas, humor e comportamento documentados.</p>
          </div>
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-star"></i></div>
            <h4>Avalie seu Passeador</h4>
            <p>Após cada passeio, deixe sua avaliação e ajude a comunidade Petway a crescer com qualidade.</p>
          </div>
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-calendar-blank"></i></div>
            <h4>Agenda Automática</h4>
            <p>Nenhuma interação necessária. O sistema gera os passeios semanalmente de forma automática.</p>
          </div>
          <div class="feature-card">
            <div class="feat-icon"><i class="ph-bold ph-chat-circle"></i></div>
            <h4>Chat com Passeador</h4>
            <p>Comunicação direta e segura dentro da plataforma. Sem compartilhamento de dados pessoais.</p>
          </div>
        </div>
      <h2 class="section-title-center">Perguntas Frequentes</h2>
      <div class="faq-list">
        <div class="faq-item">
          <button class="faq-q" onclick="toggleFaq(this)">
            <span>O que acontece se o passeador adoecer?</span>
            <span class="faq-arrow">▾</span>
          </button>
          <div class="faq-a">
            <p>Temos um pool de passeadores certificados de backup em cada região. Em caso de indisponibilidade, você será notificado e um substituto de igual qualificação assumirá o passeio sem custo adicional.</p>
          </div>
        </div>
        <div class="faq-item">
          <button class="faq-q" onclick="toggleFaq(this)">
            <span>Posso cancelar a qualquer momento?</span>
            <span class="faq-arrow">▾</span>
          </button>
          <div class="faq-a">
            <p>Sim. Não há fidelidade nem multa de cancelamento. Você pode encerrar sua assinatura a qualquer momento através da plataforma. O serviço continua até o fim do período já pago.</p>
          </div>
        </div>
        <div class="faq-item">
          <button class="faq-q" onclick="toggleFaq(this)">
            <span>Como funciona o agendamento automático?</span>
            <span class="faq-arrow">▾</span>
          </button>
          <div class="faq-a">
            <p>Todo domingo, nosso sistema gera automaticamente os passeios da semana seguinte com base no seu plano e horário preferido. Você não precisa confirmar nada — o passeador já chega no horário certo.</p>
          </div>
        </div>
        <div class="faq-item">
          <button class="faq-q" onclick="toggleFaq(this)">
            <span>Posso mudar de plano depois de assinar?</span>
            <span class="faq-arrow">▾</span>
          </button>
          <div class="faq-a">
            <p>Sim. Upgrades são aplicados imediatamente com ajuste proporcional no próximo ciclo. Downgrades entram em vigor no próximo mês.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

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

  <!-- ========== SUCCESS MODAL ========== -->
  <div class="modal-overlay" id="modal" onclick="closeModal(event)">
    <div class="modal-box">
      <div class="modal-icon"><i class="ph-bold ph-check-fat"></i></div>
      <h2>Assinatura Confirmada!</h2>
      <p>Bem-vindo à família Petway. Seu passeador foi notificado e a agenda da próxima semana será gerada automaticamente.</p>
      <div class="modal-details" id="modal-details"></div>
      <button class="btn-confirm" onclick="closeModal()">Ir para o Painel →</button>
    </div>
  </div>

  <script>
    // ========== STATE ==========
    const state = {
      walker: null,
      walkerRating: null,
      plan: null,
      price: null,
      time: null
    };

    // ========== WALKER SELECTION ==========
    function selectWalker(name, rating, id) {
      state.walker = name;
      state.walkerRating = rating;
      updateSummary();
      updateProgressSteps();
    }

    // ========== PLAN SELECTION ==========
    function selectPlan(name, price) {
      state.plan = name;
      state.price = price;
      updateSummary();
      updateProgressSteps();
    }

    // ========== TIME CHANGE ==========
    document.addEventListener('DOMContentLoaded', () => {
      const horario = document.getElementById('horario');
      if (horario) {
        horario.addEventListener('change', function () {
          const labels = {
            manha: 'Manhã (06h–09h)',
            tarde: 'Tarde (12h–15h)',
            noite: 'Noite (17h–20h)'
          };
          state.time = labels[this.value] || null;
          updateSummary();
          updateProgressSteps();
        });
      }
    });

    // ========== UPDATE SUMMARY ==========
    function updateSummary() {
      // Inline checkout
      const sw = document.getElementById('sum-walker');
      const sp = document.getElementById('sum-plan');
      const st = document.getElementById('sum-time');
      const spr = document.getElementById('sum-price');
      if (sw) sw.textContent = state.walker || '—';
      if (sp) sp.textContent = state.plan || '—';
      if (st) st.textContent = state.time || '—';
      if (spr) spr.textContent = state.price ? `R$ ${state.price}` : 'R$ —';

      // Sidebar
      const sbw = document.getElementById('sb-walker');
      const sbp = document.getElementById('sb-plan');
      const sbt = document.getElementById('sb-time');
      const sbpr = document.getElementById('sb-price');

      if (sbw) {
        sbw.innerHTML = state.walker
          ? `<div class="sb-selected"><strong>${state.walker}</strong><span><i class="ph-fill ph-star"></i> ${state.walkerRating || ''}</span></div>`
          : '<div class="sb-placeholder">Nenhum selecionado</div>';
      }
      if (sbp) {
        sbp.innerHTML = state.plan
          ? `<div class="sb-selected"><strong>${state.plan}</strong></div>`
          : '<div class="sb-placeholder">Nenhum selecionado</div>';
      }
      if (sbt) {
        sbt.innerHTML = state.time
          ? `<div class="sb-selected">${state.time}</div>`
          : '<div class="sb-placeholder">Não definido</div>';
      }
      if (sbpr) sbpr.textContent = state.price ? `R$ ${state.price}` : 'R$ —';
    }

    // ========== PROGRESS STEPS ==========
    function updateProgressSteps() {
      const steps = document.querySelectorAll('.pstep');
      steps.forEach(s => s.classList.remove('active', 'done'));

      if (state.walker) steps[0].classList.add('done');
      if (state.plan) steps[1].classList.add('done');
      if (state.time) steps[2].classList.add('done');

      if (!state.walker) {
        steps[0].classList.add('active');
      } else if (!state.plan) {
        steps[0].classList.add('done');
        steps[1].classList.add('active');
      } else if (!state.time) {
        steps[0].classList.add('done');
        steps[1].classList.add('done');
        steps[2].classList.add('active');
      } else {
        steps[0].classList.add('done');
        steps[1].classList.add('done');
        steps[2].classList.add('done');
        steps[3].classList.add('active');
      }
    }

    // ========== CONFIRM SUBSCRIPTION ==========
    function confirmSubscription() {
      if (!state.walker || !state.plan || !state.price) {
        alert('Por favor, selecione um passeador e um plano antes de confirmar.');
        return;
      }
      const modal = document.getElementById('modal');
      const details = document.getElementById('modal-details');
      details.innerHTML = `
        <div class="modal-row"><span>Passeador</span><strong>${state.walker}</strong></div>
        <div class="modal-row"><span>Plano</span><strong>${state.plan}</strong></div>
        <div class="modal-row"><span>Horário</span><strong>${state.time || 'A definir'}</strong></div>
        <div class="modal-row total-row"><span>Total mensal</span><strong>R$ ${state.price}</strong></div>
      `;
      modal.classList.add('open');
      document.body.style.overflow = 'hidden';

      // Mark all steps done
      document.querySelectorAll('.pstep').forEach(s => { s.classList.remove('active'); s.classList.add('done'); });
    }

    function closeModal(event) {
      if (!event || event.target === document.getElementById('modal') || event.target.classList.contains('btn-confirm')) {
        document.getElementById('modal').classList.remove('open');
        document.body.style.overflow = '';
      }
    }

    // ========== FAQ TOGGLE ==========
    function toggleFaq(btn) {
      const item = btn.parentElement;
      const isOpen = item.classList.contains('open');
      document.querySelectorAll('.faq-item').forEach(i => i.classList.remove('open'));
      if (!isOpen) item.classList.add('open');
    }

    // ========== PET CHIP RADIO ==========
    document.addEventListener('DOMContentLoaded', () => {
      const petChips = document.querySelectorAll('.pet-chip');
      petChips.forEach(chip => {
        const input = document.getElementById(chip.getAttribute('for'));
        if (input) {
          input.addEventListener('change', () => {
            petChips.forEach(c => c.classList.remove('selected'));
            chip.classList.add('selected');
          });
        }
      });
    });

    document.querySelectorAll('.stars-group').forEach(container => {
    const rating = parseInt(container.getAttribute('data-rating')) || 5;
    container.innerHTML = '<i class="ph-fill ph-star"></i>'.repeat(rating);
  });
  </script>
</body>
</html>
