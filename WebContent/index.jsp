<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Home</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main>
    <section class="content clearfix">
      <div class="data clearfix">
        <div class="homeB1">
          <p>Venha Aprender<br>L�gica de Programa��o!</p>
        </div>
        <div class="homeB2">
          <c:if test="${empty logado}"> 
          <a href="#">
            <div class="homeBox login">
              <h4>Login</h4>
              <img src="images/login.svg" alt="">
            </div>
          </a>
          <a href="cadastro?tipo=aluno">
            <div class="homeBox regUsr">
              <h4>Cadastro de Alunos</h4>
              <img src="images/cadaluno.svg" alt="">
            </div>
          </a>
          <a href="cadastro?tipo=escola">
            <div class="homeBox">
              <h4>Cadastro de Escolas</h4>
              <img src="images/cadescola.svg" alt="">
            </div>
          </a>
          </c:if>
          <c:if test="${not empty logado}"> 
          <div class="homeBox bemVindo">
            <h4>Bem-Vindo!</h4>
            <p>Ol� <em>${logado.getNm_usuario()}</em>! Eu sou o Payaso, prazer!</p>
          </div>
          <a href="chat">
            <div class="homeBox vamosAprender">
              <h4>Vamos aprender?</h4>
              <p>Que tal aprender um pouco mais sobre l�gica de programa��o?</p>
            </div>
          </a>
          <c:url value="perfil" var="perfilUsuario">
            <c:param name="tipo" value="aluno"/>
            <c:param name="id" value="${logado.getId_usuario()}"/>
          </c:url>
          <a href="${perfilUsuario}">
            <div class="homeBox seusPontos">
              <h4>Seus pontos</h4>
              <p>Atualmente voc� tem ${logado.getNr_pontuacao()} pontos. Continue praticando.</p>
            </div>
          </a>
          </c:if>
        </div>
        <div class="homeB3 clearfix">
          <img src="images/ibmWatson.png" alt="">
          <p>Ol�, vamos aprender programar? Usando forma simples e interativa, com sua imagina��o e uma ajudinha de nosso Payaso, atrav�s da tecnologia Watson da IBM, voc� ir� transformar em realidade algumas delas, aprendendo a programar atrav�s de perguntas e obtendo respostas na mesma hora, aprendendo l�gica de programa��o, aplicando e executando e o melhor, tudo produzido por voc�. Tudo disponibilizado de forma gratuita, inicie agora mesmo, vamos!!!</p>
        </div>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>