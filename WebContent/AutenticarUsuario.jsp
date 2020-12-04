<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login do Sistema</title>
</head>
<body>

	<h1 align="center">Login do Sistema</h1>

	<form action="AutenticarUsuario.do" method="post">



		Login: <input type="text" name="login"><br /> Senha: <input
			type="password" name="senha"><br /> 
			<input type="submit" value="Entrar">

		${msg}<br>

	</form>
</body>
</html>