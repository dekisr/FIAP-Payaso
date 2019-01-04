<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - Admin</title>
</head>
<body>
	<%@ include file="/WEB-INF/pages/includes/menu.jsp"%>
	<main>
	<section class="content">
		<div class="data clearfix">
			<h1>Admin - Editar usuários</h1>
			<table>
				<thead>
					<tr>
						<th>ID Usuario</th>
						<th>Nome</th>
						<th>Editar</th>
						<th>Deletar</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usu" items="${listaUsuarios}">
					<c:if test="${admin != false && usu.getId_usuario() != logado.getId_usuario()}">
						<tr>
							<td>${usu.getId_usuario()}</td>
							<td>${usu.getNm_usuario()}</td>
							<td>
								<form action="editarUsuario" method="post">
									<input name="idUsuario" type="hidden"
										value="${usu.getId_usuario()}">
									<button type="submit" class="adminEditar">&#x1f4dd;</button>
								</form>
							</td>
							<td>
								<form action="deletarUsuario" method="post">
									<input name="idUsuario" type="hidden"
										value="${usu.getId_usuario()}">
									<button type="submit" class="adminEditar">&#x26D4;</button>
								</form>
							</td>
						</tr>
					</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<%@ include file="/WEB-INF/pages/includes/footer.jsp"%>
	</main>
</body>
</html>