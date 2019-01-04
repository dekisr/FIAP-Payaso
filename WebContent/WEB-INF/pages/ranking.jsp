<%@ include file="/WEB-INF/pages/includes/header.jsp"%>
<title>Payaso - Ranking</title>
</head>
<body>
	<%@ include file="/WEB-INF/pages/includes/menu.jsp"%>
	<main id="Ranking">
	<section class="content">
		<div class="data clearfix">
			<h1>Ranking Geral</h1>
			<table>
				<thead>
					<tr>
						<th>Escola</th>
						<th>Pontos</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="esc" items="${listaEscolas}">
						<c:url value="perfil" var="perfilEscola">
							<c:param name="tipo" value="escola" />
							<c:param name="id" value="${esc.getId_escola()}" />
						</c:url>
						<tr>
							<td><a href="${perfilEscola}">${esc.getNm_escola()}</a></td>
							<td>${esc.getNr_pontos()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<%@ include file="/WEB-INF/pages/includes/footer.jsp"%>
	</main>
</body>
</html>