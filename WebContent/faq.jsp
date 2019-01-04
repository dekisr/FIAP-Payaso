<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - FAQ</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main id="FAQ">
    <section class="content">
      <div class="data clearfix">
        <h1>Perguntas Frequentes</h1>
        <div class="left">
          <div class="navFaq">
            <ul>
              <li><a href="#">Básico</a></li>
              <li><a href="#">Conta</a></li>
              <li><a href="#">Privacidade</a></li>
            </ul>
          </div>
        </div>
        <div class="right">
          <div class="ask">
            <h4>Como é feito nosso chatbot?</h4>
            <p>Nós utilizamos uma API (Interface de programação de aplicações) do Watson, uma inteligência artificial da IBM. Programamos toda a parte de perguntas e respostas para proporcionar uma boa experiência para o usuário.</p>
          </div>
          <div class="ask">
            <h4>Se eu sair da escola, eu perco tudo que eu aprendi ?</h4>
            <p>Não, pode ficar tranquilo, apenas não terá mais pontuações.</p>
          </div>
          <div class="ask">
            <h4>Como é dado o as informações sobre conteúdo?</h4>
            <p>O conteúdo é dado em cima da lógica de programação, dando oportunidade de aprofundamento para o usuário que tem contato com a matéria e também aquele que quer aprender de forma correta e interativa.</p>
          </div>
          <div class="ask">
            <h4>Precisa de noções de matemática?</h4>
            <p>Não precisa ter uma noção aprofundada, todo o conteúdo será dedicado para usuários de nível iniciante, onde a matemática estará ligado somente nas operações matemáticas , soma, subtração, multiplicação e divisão. Daremos todo o passo a passo para o usuário desenvolver a lógica correta.</p>
          </div>
        </div>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>