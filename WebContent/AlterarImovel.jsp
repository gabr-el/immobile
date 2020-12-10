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


<title>Atualizar Informações do Imovel</title>
</head>
<body>
	<nav class="navbar  navbar-inverse" style="background-color: #000000;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="ListarImoveis.jsp"><img src="imagem\Capturar.PNG"
				style="height: 40px;"></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div id="navbarCollapse" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item"><a class="nav-link" href="AutenticarUsuario.jsp">Sair</a>
				</li>
			</ul>
		</div>
	</nav>

	<h1>Atualização de Imóvel</h1>
	<form action="AlterarImovel.do" method="post"
		enctype="multipart/form-data">

		<h1>Identificação da Casa</h1>
		<%
                 		int id = Integer.parseInt(request.getParameter("id"));

                 	                 			ImovelDao imovelDao = new ImovelDao();
                 	                 			Imovel imovel = imovelDao.getImovel(id);
                 	%>
		<input type="hidden"name="id" value="<%= imovel.getId()%>"/>
		<div class="form-group">
			<label for="exampleFormControlSelect1">Tipo do Imóvel:</label> <input
				class="form-control" id="exampleFormControlSelect1" type="text" name="tipo_imovel" value="<%= imovel.getTipo_imovel()%>">
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Cidade:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="cidade" value="<%= imovel.getCidade()%>"></input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Bairro:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="bairro" value="<%= imovel.getBairro()%>"></input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Endereço:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="endereco" value="<%= imovel.getEndereco()%>"></input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Quartos:</label>
			<input class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_quartos" value="<%= imovel.getQuantidade_quartos()%>">
				
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Salas:</label> <input
				class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_salas" value="<%= imovel.getQuantidade_salas()%>">
				
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Vaga de Garagem:</label> <input
				class="form-control" id="exampleFormControlSelect1" type="number" name="vaga_garagem" value="<%= imovel.getVaga_garagem()%>">
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Piscina?</label> <input
				class="form-control" id="exampleFormControlSelect1" type="text" name="piscina">
	
			</input>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Pessoas:</label> <input
				class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_pessoas" value="<%= imovel.getQuantidade_pessoas()%>">
				
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Disponível?</label> <input
				class="form-control" id="exampleFormControlSelect1" type="text" name="disponivel" value="<%= imovel.getDisponivel()%>">
				
			</input>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Titulo:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="titulo" value="<%= imovel.getTitulo()%>"></input>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">Descrição:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" type="text" name="descricao" value="<%= imovel.getDescricao()%>"></input>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlTextarea1">Identificador do Usuário:</label>
			<input class="form-control" id="exampleFormControlTextarea1"
				rows="1" type="text" name="usuarioid" type="number" name="usuarioid" value="<%= imovel.getUsuarioid()%>"></input>
		</div>
		
		<label for="exampleFormControlTextarea1">Foto:</label> <input
			type="file" name="foto"/> <br> <br>

		<div class="from-group" style="text-align: center; margin-top: 2%;">
			<input style="margin-bottom: 2rem;" class="btn btn-primary"
				type="submit" value="Salvar">
		</div>
		<div class="from-group" style="text-align: center; margin-top: 2%;">
			<input style="margin-bottom: 2rem;" class="btn btn-primary"
				type="submit" value="Voltar" onclick="window.location.assign('ListarImoveis.jsp')">
				</div>
	</form>

</body>
</html>