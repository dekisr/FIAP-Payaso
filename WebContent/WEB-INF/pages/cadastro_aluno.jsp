<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Cadastro Aluno</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main>
    <section class="content">
      <div class="data clearfix">
        <h1>Cadastro</h1>
        <form action="cadastroAluno" method="post">
          <input name="nome" placeholder="Digite seu Nome" type="text" tabindex="1" required autofocus>
          <input name="email" id="emailUsuario" placeholder="Digite seu Email" type="email" maxlength="100" tabindex="2" required>
          <input name="emailConf" placeholder="Confirme seu Email" type="email" maxlength="100" tabindex="3" required
          oninput="checarEmail(this)">
          <select name="escola">
            <option value="0" tabindex="4">Selecione a sua escola</option>
	          <c:forEach var="esc" items="${listaEscolas}">
	            <option value="${esc.getId_escola()}">${esc.getNm_escola()}</option>
	          </c:forEach>
          </select>
          <textarea name="bio" placeholder="Descrição(Bio)" rows="4" cols="80" tabindex="5"></textarea>
          <input name="senha" id="senhaUsuario" placeholder="Digite sua senha" type="password" 
          pattern=".{6,20}" maxlength="20" tabindex="6" required 
          oninvalid="this.setCustomValidity('Deve conter no mínimo 6 e no máximo 20 caracteres.')" 
          oninput="setCustomValidity('')">
          <input name="senhaConf" placeholder="Confirme sua senha" type="password" maxlength="20" tabindex="7" required 
          oninput="checarSenha(this)">
          <button name="submit" type="reset">Limpar</button>
          <button name="submit" type="submit" tabindex="8">Registrar</button>
        </form>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>