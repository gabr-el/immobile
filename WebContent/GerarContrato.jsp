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


<title>Gerar Contrato</title>
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
				<li><input class="form-control mr-sm-2" id="myInput"
					type="text" placeholder="Procurar..." style="margin-top: 8px;"></li>
				<li class="nav-item active"><a class="nav-link"
					href="AutenticarUsuario.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AutenticarUsuario.jsp">Sair</a></li>
			</ul>
		</div>
	</nav>
	
	<embed src="contrato-aluguel.pdf" width="100%" height="550" type='application/pdf'>

<div class="alert alert-info" style="text-align: center;">
	Por favor, baixe o documento. Preencha o formulário abaixo. Em seguida adicione-o digitalizado ou por foto.
</div>
<form action="CadastrarContrato.do" method="post" enctype="multipart/form-data">
			Duração em Horas: <input type="number" name="duracao_horas" /><br>
			Data de Início: <input type="date" name="data_inicio" /><br>
			Data Final: <input type="date" name="data_fim" /><br>
			Valor do Contrato:<input type="number" name="valor_contrato"/><br>
			Identificador do Usuário <input type="text" name="usuarioid"/><br/>
			Identificador do Imovel: <input type="text" name="imovelid"/><br/>
			
			<input type="file" name="file" /><br/>
		
		<input type="button" value="Voltar" onclick = "window.location.assign('ListarImoveis.jsp')"/>
			
			<input type="submit" value="Salvar" />
			</form>
   <br><br><br>
   <<footer class="footer navbar-fixed-bottom" style="text-align:center;"><strong>&copy; 2020 Immobile Desenvolvido por:<br> Gilmar, José
   Carlos & Gabriel</strong></footer>


</body>
</html>

</body>
</html>