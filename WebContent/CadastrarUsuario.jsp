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


<title>Cadastro de Usuário</title>
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
					href="login.html">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="CadastrarImovel.jsp">Cadastrar Imóvel</a>
				<li class="nav-item"><a class="nav-link" href="AutenticarUsuario.jsp">Sair</a>
				</li>
			</ul>
		</div>
	</nav>

	<h1>Cadastrar Usuário</h1>
	<form action="CadastrarUsuario.do" method="post"
		enctype="multipart/form-data">

		<h1>Identificação Pessoal</h1>


		<div class="form-group">
			<label for="exampleFormControlInput1">Cpf:</label> <input
				type="number" name="cpf" class="form-control"
				id="exampleFormControlInput1" placeholder="000.000.000-00"
				required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Nome:</label> <input
				type="text" name="nome" class="form-control"
				id="exampleFormControlInput1" placeholder="Nome" required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Endereço:</label> <input
				type="text" name="endereco" class="form-control"
				id="exampleFormControlInput1" placeholder="Endereço" required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Cidade:</label> <input
				type="text" name="cidade" class="form-control"
				id="exampleFormControlInput1" placeholder="Cidade" required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Bairro:</label> <input
				type="text" name="bairro" class="form-control"
				id="exampleFormControlInput1" placeholder="Bairro" required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Login:</label> <input
				type="text" name="login" class="form-control"
				id="exampleFormControlInput1" placeholder="Login" required="">
		</div>

		<div class="form-group">
			<label for="exampleFormControlInput1">Email:</label> <input
				type="email" name="email" class="form-control"
				id="exampleFormControlInput1" placeholder="email@gmail.com "
				required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlInput1">Senha:</label> <input
				type="password" name="senha" class="form-control"
				id="exampleFormControlInput1" placeholder="Senha" required="">
		</div>
		<div class="form-group">
			<label for="exampleFormControlSelect1">Tipo</label> <select
				class="form-control" id="exampleFormControlSelect1" name="tipo">
				<option value="administrador">Administrador</option>
				<option value="usuario">Usuario Comum</option>
			</select>
		</div>

		<input type="file" /> <br> <input style="margin-bottom: 2rem;"
			class="btn btn-primary" type="submit" value="Salvar"
			onclick="window.location.assign('ListarImoveis.jsp')">

	</form>

	<footer style="text-align: center;"> <strong>&copy;
		2020 Immobile Desenvolvido por:<br> Gilmar, José Carlos & Gabriel
	</strong></footer>


</body>
</html>