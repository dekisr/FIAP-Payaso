<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Avaliação</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main id="Avaliação">
    <section class="content">
      <div class="data clearfix">
        <h1>Avaliação</h1>
        <div class="ask clearfix">
          <h4>Teste 92</h4>
          <p>Escreva um algoritmo que recebe um número x ele imprime x². Lembre-se que x² = x * x.</p>
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