<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - Perfil ${escola.getNm_escola()}</title>
</head>
<body>
	<%@ include file="/WEB-INF/pages/includes/menu.jsp"%>
	<main id="Escola">
	<section class="content">
		<div class="header clearfix">
			<div class="left">
				<img src="${escola.getDs_img()}" alt="Avatar da Escola"
					class="avatar">
			</div>
			<div class="right">
				<div class="desc">
					<h2>${escola.getNm_escola()}</h2>
					<p>${escola.getDs_bio()}</p>
				</div>
			</div>
		</div>
		<div class="data clearfix">
			<div class="left">
				<c:if test="${escola.getNr_pontos() > 0}">
				<div class="badges">
					<c:if test="${escola.getNr_pontos() > 100}">
					<h4 class="medalhas">Medalhas</h4>
					<img src="images/medalha01.svg" alt="Medalha de Conquista 01">
					</c:if>
					<c:if test="${escola.getNr_pontos() > 100}">
					<img src="images/medalha02.svg" alt="Medalha de Conquista 02">
					</c:if>
				</div>
				</c:if>
			</div>
			<div class="right">
				<div class="stats">
					<p>
						Alunos Cadastrados:<em>${qtdAlunos}</em>
					</p>
					<p>
						Pontuação Total:<em>${escola.getNr_pontos()}</em>
					</p>
					<p>
						Pontuação do Mês:<em>${escola.getNr_pontos()}</em>
					</p>
				</div>
				<h2>Alunos em destaque:</h2>
				<c:forEach begin="0" end="3" var="aluno" items="${alunosEmDestaque}">
					<c:url value="perfil" var="perfilAluno">
						<c:param name="tipo" value="aluno"/>
						<c:param name="id" value="${aluno.getId_usuario()}"/>
					</c:url>
					<a href="${perfilAluno}"><img src="${aluno.getDs_img()}" alt="${aluno.getNm_usuario()}" class="aluno"></a>
				</c:forEach>
				<h2>Mensagens:</h2>
				<c:forEach var="msg" items="${mensagens}">
	      	${msg}
	      </c:forEach>
				<c:if test="${not empty logado}">
					<form action="mensagem" method="post">
						<input type="hidden" name="tipo" value="escola" /> <input
							type="hidden" name="idEscola" value="${escola.getId_escola()}" />
						<input type="hidden" name="idUsuario"
							value="${logado.getId_usuario()}" />
						<textarea name="texto" rows="3" cols="80"></textarea>
						<button type="submit" name="submit">Enviar</button>
					</form>
				</c:if>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/pages/includes/footer.jsp"%>
	</main>
</body>
</html>