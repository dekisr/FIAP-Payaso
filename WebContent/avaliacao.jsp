<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Avalia��o</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main id="Avalia��o">
    <section class="content">
      <div class="data clearfix">
        <h1>Avalia��o</h1>
        <div class="ask clearfix">
          <h4>Teste 92</h4>
          <p>Escreva um algoritmo que recebe um n�mero x ele imprime x�. Lembre-se que x� = x * x.</p>
          <form action="" method="post" class="exam">
            <textarea name="answer" rows="6" cols="80"></textarea>
            <button type="submit" name="submit">Enviar resposta</button>
          </form>
        </div>
        <div class="timer">31:02 minutos restantes</div>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>