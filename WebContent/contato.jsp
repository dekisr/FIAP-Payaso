<%@ include file="/WEB-INF/pages/includes/header.jsp" %>
  <title>Payaso - Contato</title>
</head>
<body>
  <%@ include file="/WEB-INF/pages/includes/menu.jsp" %>
  <main id="Contato">
    <section class="content">
      <div class="data clearfix">
        <h1>Contate-nos</h1>
          <form action="https://formspree.io/ibmprojeto@gmail.com" method="post">
            <input type="text" name="nome" placeholder="Digite seu nome" required>
            <input type="email" name="email" placeholder="Digite seu email" required>
            <input type="text" name="assunto" placeholder="Assunto" required>
            <textarea name="msgCli" placeholder="Digite sua msg" rows="5" cols="80" required></textarea>
            <button type="submit" name="submit">Enviar</button>
          </form>
      </div>
    </section>
    <%@ include file="/WEB-INF/pages/includes/footer.jsp" %>
  </main>
</body>
</html>