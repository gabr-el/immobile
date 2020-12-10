<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Exibição do Imóvel</title>
</head>
<body>
	<nav class="navbar  navbar-inverse" style="background-color: #000000;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="ListarImoveis.jsp"><img src="imagem/Capturar.PNG"
				style="height: 40px;"></a>
			<button class="navbar-toggler-icon" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div id="navbarCollapse" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item active"><a class="nav-link"
					href="AutenticarUsuario.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AutenticarUsuario.jsp">Sair</a></li>
			</ul>
		</div>
	</nav>
	<%
		int linhas = 1;
	int paginaAtual = 1;
	int paginaInicial = 1;

	if (request.getParameter("linhas") != null) {
		linhas = Integer.parseInt(request.getParameter("linhas"));
	}

	if (request.getParameter("paginaAtual") != null) {
		paginaAtual = Integer.parseInt(request.getParameter("paginaAtual"));
	}

	if (request.getParameter("paginaInicial") != null) {
		paginaInicial = Integer.parseInt(request.getParameter("paginaInicial"));
	}
	%>

	<%
		ImovelDao imovelDao = new ImovelDao();
	int totalImovel = imovelDao.totalImovel();
	int totalPaginas = totalImovel / linhas;
	if ((totalImovel % linhas) > 0) {
		//totalPaginas++;
	}
	List<Imovel> imoveis = imovelDao.getListaImovel(linhas, paginaAtual);
	for (Imovel imovel : imoveis) {
	%>

	<div class="row">
		<div class="container">
			<div class="card-body" style="text-align: center;">
				<br>
				<div style="text-align: center;">

					<div class="card" style="width: auto;">
						<img class="card-img-top" src="<%=imovel.getFoto()%>"
							alt="Imagem de capa do card">
						<div class="card-body">
							<h5 class="card-title">
								Título:<li class="list-group-item"><img src="icons/card-text.svg"
									alt="" width="32" height="32" title="Bootstrap"><%=imovel.getTitulo()%></li>
							</h5>
							<p class="card-text">Descrição:<li class="list-group-item"><img
								src="icons/file-earmark-richtext.svg" alt="" width="32"
								height="32" title="Bootstrap"><%=imovel.getDescricao()%></li></p>

						</div>
						<ul class="list-group list-group-flush">
							Tipo de Imóvel:
							<li style="text-align: center;" class="list-group-item"><img
								src="icons/house-door.svg" alt="" width="32" height="32"
								title="Bootstrap"><%=imovel.getTipo_imovel()%></li> Cidade:
							<li class="list-group-item"><img src="icons/map.svg" alt=""
								width="32" height="32" title="Bootstrap"><%=imovel.getCidade()%></li>
							Bairro:
							<li class="list-group-item"><img src="icons/compass.svg"
								alt="" width="32" height="32" title="Bootstrap"> <%=imovel.getBairro()%></li>
							Endereço
							<li class="list-group-item"><img src="icons/geo-alt.svg"
								alt="" width="32" height="32" title="Bootstrap"> <%=imovel.getEndereco()%></li>
							Quantidade de Quartos:
							<li class="list-group-item"><img src="icons/moon.svg" alt=""
								width="32" height="32" title="Bootstrap"> <%=imovel.getQuantidade_quartos()%></li>
							Quantidade de Salas
							<li class="list-group-item"><img src="icons/tv.svg" alt=""
								width="32" height="32" title="Bootstrap"> <%=imovel.getQuantidade_salas()%></li>
							Quantidade de Vagas de Garagem:
							<li class="list-group-item"><img src="icons/cart.svg" alt=""
								width="32" height="32" title="Bootstrap"> <%=imovel.getVaga_garagem()%></li>
							Piscina?
							<li class="list-group-item"><img
								src="icons/droplet-half.svg" alt="" width="32" height="32"
								title="Bootstrap"> <%=imovel.getPiscina()%></li> Quantidade de
							Pessoas:
							<li class="list-group-item"><img src="icons/people.svg"
								alt="" width="32" height="32" title="Bootstrap"> <%=imovel.getQuantidade_pessoas()%></li>
							Disponível?
							<li class="list-group-item"><img src="icons/toggles.svg"
								alt="" width="32" height="32" title="Bootstrap"> <%=imovel.getDisponivel()%></li>
							Proprietário do Imóvel:
							<li class="list-group-item"><img src="icons/person.svg"
								alt="" width="32" height="32" title="Bootstrap"><%=imovel.getUsuarioid()%></li>

						</ul>
					</div>

				</div>
			</div>
			<%
				}
			%>
			<br>

		</div>
	</div>

	<a href="GerarContrato.jsp">
		<div class="from-group" style="text-align: center; margin-top: 2%;">
			<input style="margin-bottom: 2rem;" class="btn btn-info"
				type="submit" value="Gerar proposta de contrato!">
		</div>
	</a>

	<br>
	<footer style="text-align: center;"> <strong>&copy;
		2020 Immobile Desenvolvido por:<br> Gilmar, José Carlos & Gabriel
	</strong></footer>



</body>
</html>