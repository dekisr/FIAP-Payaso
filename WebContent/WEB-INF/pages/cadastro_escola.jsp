<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Cadastro Escola</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main>
    <section class="content">
      <div class="data clearfix">
        <h1>Cadastre sua escola</h1>
        <form action="cadastroEscola" method="post">
          <input name="nomeEscola" placeholder="Nome da escola" type="text" 
          maxlength="50" tabindex="1" required autofocus 
          oninvalid="this.setCustomValidity('Máximo de 50 caracteres.')" 
          oninput="setCustomValidity('')">
          
          <input name="endereco" placeholder="Endereço" type="text" 
          maxlength="50" tabindex="2" required
          oninvalid="this.setCustomValidity('Máximo de 50 caracteres.')" 
          oninput="setCustomValidity('')">
          
          <input name="numero" placeholder="Número" type="text" 
          pattern="[0-9]{1,6}" maxlength="8" tabindex="3" required 
          oninvalid="this.setCustomValidity('Deve conter apenas números, no máximo 6 caracteres.')" 
          oninput="setCustomValidity('')">
          
          <input name="cep" placeholder="CEP (Apenas os números)" type="text" 
          pattern="[0-9]{8}" maxlength="8" tabindex="4" required 
          oninvalid="this.setCustomValidity('Deve conter 8 caracteres numéricos.')" 
          oninput="setCustomValidity('')">
          
          <input name="complemento" placeholder="Complemento" type="text" 
          maxlength="30" tabindex="5" required 
          oninvalid="this.setCustomValidity('Deve conter no máximo 30 caracteres.')" 
          oninput="setCustomValidity('')">
          
          <textarea name="bio" placeholder="Descrição(Bio)" rows="4" cols="80" tabindex="6"></textarea>
          
          <button name="submit" type="reset">Limpar</button>
          <button name="submit" type="submit" tabindex="7">Registrar</button>
        </form>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>