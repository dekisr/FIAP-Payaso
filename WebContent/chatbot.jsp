<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - ChatBot</title>
</head>
<body>
	<%--   <%@ include file="/WEB-INF/pages/includes/menu.jsp" %> --%>
	<main> <header>
		<a href="index.jsp"><img src="images/logotest.svg" alt="Logo"
			class="logo"></a>
		<c:if test="${not empty logado}">
			<c:url value="perfil" var="perfilUsuario">
				<c:param name="tipo" value="aluno" />
				<c:param name="id" value="${logado.getId_usuario()}" />
			</c:url>
			<c:url value="perfil" var="perfilEscola">
				<c:param name="tipo" value="escola" />
				<c:param name="id" value="${logado.getId_escola()}" />
			</c:url>
			<div class="menu">
				<img src="${logado.getDs_img()}" alt="Avatar do Usuário"> <a
					href="" class="user">${logado.getNm_usuario()}</a>
				<menu class="menuList">
					<a href="${perfilUsuario}">Perfil</a>
					<a href="${perfilEscola}">Escola</a>
					<a href="ranking">Ranking</a>
					<a href="avaliacao.jsp">Avaliação</a>
					<a href="faq.jsp">FAQ</a>
					<a href="sobre.jsp">Sobre</a>
					<a href="contato.jsp">Contato</a>
				</menu>
			</div>
		</c:if>
	</header>
	<section class="chatbot">
		<div class="chatInput">
			<form action="chat" method="post">
				<input type="text" name="pergunta">
				<button type="submit">&#10148;</button>
			</form>
		</div>
		<div class="chat">
			<div class="chatlog">
				<c:forEach items="${conversa}" var="dialogo">
            ${dialogo}
          </c:forEach>
				<p class="msgRight">
					Olá! Bom dia
					<c:if test="${not empty logado}">${logado.getNm_usuario()}</c:if>
					! Eu sou o Payaso e estou aqui para te ajudar. O que vamos aprender
					hoje?
				</p>
				<p class="msgRight">Opa! Agora vai...</p>
				<p class="msgRight">Hm... 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
					17 18 19 20 21 22 23 24 25 26 27 28 29 30 40 41 42 43 44 45 46 47
					48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69
					70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91
					92 93 94 95 96 97 98 99... num=num+1!</p>
				<p class="msgRight">Alô, tem alguém ai? Fala comigo!
					Alooooooooooô???</p>
				<p class="msgRight">Entendeu?</p>
				<p class="msgRight">E por que eu sairia daqui? Estou sempre aqui
					para ajudar as pessoas que querem aprender!</p>
				<p class="msgLeft">Ei Payaso, você nunca sai daqui?</p>
			</div>
		</div>
	</section>
	</main>
</body>
</html>
