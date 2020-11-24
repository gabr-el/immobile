<%@page import="immobile.dao.*"%>
<%@page import="immobile.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exclusão de usuário</title>
</head>
<body>

        <h1>Excluir Usuarios</h1>
       
          
	<%
                 		int id = Integer.parseInt(request.getParameter("id"));

                 	                 			UsuarioDao usuarioDao = new UsuarioDao();
                 	                 			Usuario usuario = usuarioDao.getUsuario(id);
                 	%>
	
	
	<form action="ExcluirUsuario.do" method="post">
	<input type="hidden"name="id" value="<%= usuario.getId()%>"/>
	Cpf: <input type="number" readonly="readonly" name="cpf" value="<%= usuario.getCpf()%>"/><br>
	Nome: <input type="text" readonly="readonly" name="nome" value="<%= usuario.getNome()%>"/><br>
	Endereço: <input type="text" readonly="readonly" name="endereco" value="<%= usuario.getEndereco()%>"/><br>
	Cidade: <input type="text" readonly="readonly" name="cidade" value="<%= usuario.getCidade()%>"/><br>
	Bairro: <input type="text" readonly="readonly" name="bairro" value="<%= usuario.getBairro()%>"/><br>
	Login: <input type="text" readonly="readonly" name="login" value="<%= usuario.getLogin()%>"/><br>
	Email: <input type="text" readonly="readonly" name="email" value="<%= usuario.getEmail()%>"/><br>
	Senha: <input type="text" readonly="readonly" name="senha" value="<%= usuario.getSenha()%>"/><br>
	Tipo: <input type="text" readonly="readonly" name="tipo" value="<%= usuario.getTipo()%>"/><br>		
	Foto:<input type="hidden" name="foto" value="<%= usuario.getFoto()%>"/><br> 
	<input type="submit" value="Excluir"/>
	


</form>
</body>
</html>
