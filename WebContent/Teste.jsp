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


<title>Insert title here</title>
</head>
<body>
	<nav class="navbar  navbar-inverse" style="background-color: #000000;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="indexLogado.html"><img src="imagem/Capturar.png"
				style="height: 40px;"></a>
			<button class="navbar-toggler-icon" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div id="navbarCollapse" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item active"><a class="nav-link"
					href="login.html">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="index.html">Sair</a>
				</li>
			</ul>
		</div>
	</nav>


	<%
		int linhas = 5;
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
		totalPaginas++;
	}
	List<Imovel> imoveis = imovelDao.getListaImovel(linhas, paginaAtual);
	for (Imovel imovel : imoveis) {
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<a href="galeria1.html"><img src="<%=imovel.getFoto()%>"
						alt="Lights" style="width: 100%"> <footer
							class="card-title"> <font color="#000000"><b><td><%=imovel.getEndereco()%></td></b></font>
						<font color="#ff0000"> <span
							class="glyphicon glyphicon-map-marker"></span></footer> </font> </a>
				</div>
			</div>
		</div>
	</div>
	<br>

	<%
		}
	%>

</body>
</html>