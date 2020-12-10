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


<title>Cadastrar Imóvel</title>
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

	<h1>Cadastrar Imovel</h1>
	<form action="CadastrarImovel.do" method="post"
		enctype="multipart/form-data">

		<h1>Identificação da casa</h1>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Tipo de immovel</label> <select
				class="form-control" id="exampleFormControlSelect1" type="text" name="tipo_imovel">
				<option value="casa">Casa</option>
				<option value="espaco">Espaço de Eventos</option>
				<option value="apartamento">Apartamento</option>

			</select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Cidade:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="cidade"></textarea>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Bairro:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="bairro"></textarea>
		</div>

		<div class="form-group">
			<label for="exampleFormControlTextarea1">Endereço:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="endereco"></textarea>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Quartos:</label>
			<select class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_quartos">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5 ou Mais</option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Salas:</label> <select
				class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_salas">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5 ou Mais</option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Vaga de Garagem:</label> <select
				class="form-control" id="exampleFormControlSelect1" type="number" name="vaga_garagem">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5 ou Mais</option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Piscina</label> <select
				class="form-control" id="exampleFormControlSelect1" type="text" name="piscina">
				<option value="true">Sim</option>
				<option value="false">Não</option>
			</select>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlSelect1">Quantidade de Pessoas</label> <select
				class="form-control" id="exampleFormControlSelect1" type="number" name="quantidade_pessoas">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5 ou Mais</option>
			</select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Disponivel</label> <select
				class="form-control" id="exampleFormControlSelect1" type="text" name="disponivel">
				<option value="true">Sim</option>
				<option value="false">Não</option>
			</select>
		</div>



		<div class="form-group">
			<label for="exampleFormControlTextarea1">Titulo:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" placeholder="R. Sifrone Cecilio dos Santos, 273" type="text" name="titulo"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">Descrição:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" type="text" name="descricao"></textarea>
		</div>
		
		<div class="form-group">
			<label for="exampleFormControlTextarea1">Identificador do Usuário:</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1" type="text" name="usuarioid" type="number" name="usuarioid"></textarea>
		</div>
		
		<label for="exampleFormControlTextarea1">Foto:</label> <input
			type="file" name="foto" /> <br> <br>

		<div class="from-group" style="text-align: center; margin-top: 2%;">
			<input style="margin-bottom: 2rem;" class="btn btn-primary"
				type="submit" value="Salvar">
		</div>
		<div class="from-group" style="text-align: center; margin-top: 2%;">
			<input style="margin-bottom: 2rem;" class="btn btn-primary"
				type="submit" value="Voltar" onclick="window.location.assign('ListarImoveis.jsp')">
				</div>
	</form>

	<footer style="text-align: center;"> <strong>&copy; 2020 Immobile Desenvolvido por:<br> Gabriel, José
	Carlos & Gilmar</strong></footer>
</body>
</html>