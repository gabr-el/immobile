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

<style>
.loading {
	
	width: 50px;
	height: 50px;
	background-color: rgba(16, 134, 231, 0.801);
	border-radius: 12px;
	animation: loading 2s linear infinite;
}

@keyframes loading {
	0% { transform: rotateX(0deg) rotateY(0deg); }

	50% { transform: rotateX(0deg) rotateY(180deg); }

	100% { transform: rotateX(180deg) rotateY(180deg); }
}

	
	
</style>

<title>Login</title>
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
				<li class="nav-item active"><a class="nav-link"
					href="login.html">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="AutenticarUsuario.jsp">Sair</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
    <form class="form-signin" action="AutenticarUsuario.do" method="post">
     
      <h1 class="h3 mb-3 font-weight-normal" style="text-align: center;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><b>LOGIN</b></font></font></h1>
      <label for="inputEmail" class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Login</font></font></label>
      <input type="text" name="login" id="inputEmail" class="form-control" placeholder="Login" required="" autofocus="">
      <br>
      <label for="inputPassword" class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Senha</font></font></label>
      <input type="password" name="senha" id="inputPassword" class="form-control" placeholder="Senha" required="">
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> Lembre de mim
          </font></font></label>

        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" value="Entrar"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Entrar</font></font></button>      
        <br>
      </form>
      
     <div class="jumbotron" style="text-align:center">${msg}</div>
      
      <a href="CadastrarUsuario.jsp" style="text-decoration: none;">Cadastre-se</a>
      <br>
      <label><a href="EsqueciSenha.jsp" style="text-decoration: none;">Esqueci minha Senha</a></label>
    </div>
    
    <div class="box" style="
display: flex;
flex-direction: row;
justify-content: center;
align-items: center">
    	<div class="loading"></div>
    </div>
    

    <br><br><br>

    <footer style="text-align: center;"> <strong>&copy; 2020 Immobile Desenvolvido por:<br> Gilmar, José
  Carlos & Gabriel</strong></footer>
 
</body>
</html>