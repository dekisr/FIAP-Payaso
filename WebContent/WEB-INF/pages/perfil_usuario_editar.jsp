<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - Editar Aluno</title>
</head>
<body>
	<%@ include file="/WEB-INF/pages/includes/menu.jsp"%>
	<main>
	<section class="content">
		<div class="data clearfix">
			<h1>Editar Informações</h1>
			<form action="atualizarUsuario" method="post">
				<input name="id" type="hidden" value="${usuario.getId_usuario()}">
				
				<input name="nome" value="${usuario.getNm_usuario()}" type="text" tabindex="1" required autofocus>
				<input name="avatar" value="${usuario.getDs_img()}" type="text" tabindex="2" required>
				<input name="email" id="emailUsuario" value="${usuario.getDs_email()}" type="email" maxlength="100" tabindex="3" required>
				<input name="emailConf" id="emailConf" placeholder="Confirme o seu email" type="email" maxlength="100" tabindex="4" required
				oninput="checarEmail(this)">
				<textarea name="bio" rows="4" cols="80" tabindex="5">${usuario.getDs_bio_usuario()}</textarea>
				<input name="senha" id="senhaUsuario" value="${usuario.getDs_senha()}" type="password" pattern=".{6,20}" maxlength="20" tabindex="6" required>
				<input name="senhaConf" id="senhaConf" value="${usuario.getDs_senha()}" type="password" maxlength="20" tabindex="7" required 
				oninput="checarSenha(this)">
				
				<c:choose>
				<c:when test="${admin == false}">
					<c:url value="perfil" var="perfilUsuario">
						<c:param name="tipo" value="aluno" />
						<c:param name="id" value="${usuario.getId_usuario()}" />
					</c:url>
					<a href="${perfilUsuario}" class="cancelar">Cancelar</a>
				</c:when>
				<c:otherwise>
					<a href="admin" class="cancelar">Cancelar</a>
				</c:otherwise>
				</c:choose>
				<button name="submit" type="submit" tabindex="7">Atualizar</button>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/pages/includes/footer.jsp"%>
	</main>
</body>
</html>