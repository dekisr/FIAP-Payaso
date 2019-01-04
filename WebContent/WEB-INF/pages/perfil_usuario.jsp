<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - Perfil de ${aluno.getNm_usuario()}</title>
</head>
<body>
	<%@ include file="/WEB-INF/pages/includes/menu.jsp"%>
	<main id="Perfil">
	<section class="content">
		<div class="header headerUsr clearfix">
			<div class="left">
				<img src="${aluno.getDs_img()}" alt="Avatar do Usuário"
					class="avatar">
			</div>
			<div class="right">
				<div class="desc descUsr clearfix">
					<h2>${aluno.getNm_usuario()}</h2>
					<p>${aluno.getDs_bio_usuario()}</p>
					<c:if
						test="${not empty logado && aluno.getId_usuario() == logado.getId_usuario()}">
						<form action="editarUsuario" method="post">
							<button type="submit" class="editarPerfilBtn">Editar meu
								perfil</button>
						</form>
					</c:if>
				</div>
			</div>
		</div>
		<div class="data clearfix">
			<div class="left">
				<c:if test="${aluno.getNr_pontuacao() > 0}">
				<div class="badges">
					<c:if test="${aluno.getNr_pontuacao() > 100}">
					<h4 class="medalhas">Medalhas</h4>
					<img src="images/medalha01.svg" alt="Medalha de Conquista 01">
					</c:if>
					<c:if test="${aluno.getNr_pontuacao() > 200}">
					<img src="images/medalha02.svg" alt="Medalha de Conquista 02">
					</c:if>
				</div>
				</c:if>
			</div>
			<div class="right">
				<div class="stats">
					<c:url value="perfil" var="perfilEscola">
						<c:param name="tipo" value="escola" />
						<c:param name="id" value="${escola.getId_escola()}" />
					</c:url>
					<p>
						<a href="${perfilEscola}">${escola.getNm_escola()}</a>
					</p>
					<p>Pontos no Mês: ${aluno.getNr_pontuacao()}</p>
					<p>Total de pontos: ${aluno.getNr_pontuacao()}</p>
				</div>
				<h2>Mensagens:</h2>
				<c:forEach var="msg" items="${mensagens}">${msg}</c:forEach>
				<c:if test="${not empty logado}">
					<form action="mensagem" method="post">
						<input type="hidden" name="tipo" value="aluno" /> <input
							type="hidden" name="idDestinatario"
							value='${aluno.getId_usuario()}' /> <input type="hidden"
							name="idUsuario" value="${logado.getId_usuario()}" />
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