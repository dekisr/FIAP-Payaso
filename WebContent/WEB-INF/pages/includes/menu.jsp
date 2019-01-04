
<nav>
	<div class="bar">
		<a href="index.jsp"><img src="images/logo.svg" alt="" class="logo"></a>
		<ul class="menuBar">
			<c:if test="${not empty logado}">
				<c:url value="perfil" var="perfilUsuario">
					<c:param name="tipo" value="aluno" />
					<c:param name="id" value="${logado.getId_usuario()}" />
				</c:url>
				<c:url value="perfil" var="perfilEscola">
					<c:param name="tipo" value="escola" />
					<c:param name="id" value="${logado.getId_escola()}" />
				</c:url>
				<li><a href="chat">Chatbot</a></li>
				<li><a href="${perfilUsuario}">Perfil</a></li>
				<li><a href="${perfilEscola}">Escola</a></li>
				<li><a href="ranking">Ranking</a></li>
				<li><a href="avaliacao.jsp">Avaliação</a></li>
				<li><a href="logout">Logout</a></li>
			</c:if>
			<c:if test="${empty logado}">
				<li><a href="chat">Chatbot</a></li>
				<li><a href="#" class="loginBtn">Login</a></li>
			</c:if>
		</ul>
		<div class="btnMenuDrop">
			<a>&#x1F4A0;</a>
		</div>
		<div class="divMenuDrop">
			<div class="menuDrop">
				<ul class="menuDropList">
					<c:if test="${not empty logado}">
						<c:url value="perfil" var="perfilUsuario">
							<c:param name="tipo" value="aluno" />
							<c:param name="id" value="${logado.getId_usuario()}" />
						</c:url>
						<c:url value="perfil" var="perfilEscola">
							<c:param name="tipo" value="escola" />
							<c:param name="id" value="${logado.getId_escola()}" />
						</c:url>
						<li><a href="chat">Chatbot</a></li>
						<li><a href="${perfilUsuario}">Perfil</a></li>
						<li><a href="${perfilEscola}">Escola</a></li>
						<li><a href="ranking">Ranking</a></li>
						<li><a href="avaliacao.jsp">Avaliação</a></li>
						<li><a href="logout">Logout</a></li>
					</c:if>
					<c:if test="${empty logado}">
						<li><a href="chat">Chatbot</a></li>
						<li><a href="#" class="loginBtnDrop">Login</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>
<div class="loginDiv">
	<div class="loginDiv-conteudo">
		<a class="loginFechar">Fechar [ X ]</a>
		<h4>Login:</h4>
		<form action="login" method="post">
			<input name="email" placeholder="Digite seu Email" type="email"
				tabindex="1" required autofocus> <input name="senha"
				placeholder="Digite sua Senha" type="password" tabindex="2" required>
			<button type="submit">Enviar</button>
		</form>
	</div>
</div>