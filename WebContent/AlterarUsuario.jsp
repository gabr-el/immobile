<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Usuário</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("id"));
	Usuario usuario = new Usuario();
	UsuarioDao usuarioDao = new UsuarioDao();
	usuario = usuarioDao.getUsuario(id);
	%>

	<h1>Alterar Usuario</h1>

	<form action="AlterarUsuario.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value=<%=usuario.getId()%> />
		Cpf: <input type="number" name="cpf" value=<%=usuario.getCpf()%> /><br>
		Nome: <input type="text" name="nome" value=<%=usuario.getNome()%> /><br>
		Endereço: <input type="text" name="endereco" value=<%=usuario.getEndereco()%> /><br>
		Cidade: <input type="text" name="cidade" value=<%=usuario.getCidade()%> /><br>
		Bairro: <input type="text" name="bairro" value=<%=usuario.getBairro()%> /><br>
		Login: <input type="text" name="login" value=<%=usuario.getLogin()%> /><br>
		Email:<input type="email" name="email" value=<%=usuario.getEmail()%> /><br>
		Senha:<input type="password" name="senha" value=<%=usuario.getSenha()%> /><br>
		Tipo: <input type="text" name="tipo" value=<%=usuario.getTipo()%> /><br>
		Foto:<img src="<%=usuario.getFoto()%>">  
		<input type="file" name="foto" accept="Image/*"/><br>
		<input
			type="button" value="Voltar"
			onclick="window.location.assign('ListarUsuarios.jsp')" /> 
			<input
			type="submit" value="Salvar" />

	</form>

</body>
</html>