<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Esqueci minha senha</title>
</head>
<body>
<body>
	<h1>Esqueci minha senha</h1>

	<%@ include file="AutenticarUsuario.jsp"%>

	<hr>
	${msg}
	<form action="EsqueciSenha.do" method="post">

		Email: <input type="text" name="email" /> <br> <input
			type="submit" value="Enviar" /><br>
</body>
</html>