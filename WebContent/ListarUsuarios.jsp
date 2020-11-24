<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lista de Usuários</title>

</head>

<body>

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

	<h1>Lista de Usuários</h1>

	<table border="2">

		<tr>
			<td>Cpf</td>
			<td>Nome</td>
			<td>Endereço</td>
			<td>Cidade</td>
			<td>Bairro</td>
			<td>Login</td>
			<td>Email</td>
			<td>Senha</td>
			<td>Tipo de Usuário</td>
			<td>Foto</td>
			<td colspan="2">Opções</td>
		</tr>

		<%
			UsuarioDao usuarioDao = new UsuarioDao();
			int totalUsuarios = usuarioDao.totalUsuarios();
			int totalPaginas = totalUsuarios / linhas;
			if ((totalUsuarios % linhas) > 0) {
				totalPaginas++;
			}
			List<Usuario> usuarios = usuarioDao.getListaUsuarios(linhas, paginaAtual);
			for (Usuario usuario : usuarios) {
		%>

		<tr>

			<td><%=usuario.getCpf()%></td>
			<td><%=usuario.getNome()%></td>
			<td><%=usuario.getEndereco()%></td>
			<td><%=usuario.getCidade()%></td>
			<td><%=usuario.getBairro()%></td>
			<td><%=usuario.getLogin()%></td>
			<td><%=usuario.getEmail()%></td>
			<td><%=usuario.getSenha()%></td>
			<td><%=usuario.getTipo()%></td>
			<td><img src="<%=usuario.getFoto()%>" width="200"
				height="50" /><br></td>
			<td><a href="AlterarUsuario.jsp?id=<%=usuario.getId()%>">Alterar</a></td>
			<td><a href="ExcluirUsuario.jsp?id=<%=usuario.getId()%>">Excluir</a></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="5" bgcolor="grey" align="center">
				<%
					for (int i = paginaInicial; i <= paginaInicial + 9; i++) {
						if (i <= totalPaginas) {
							if (i == paginaAtual) {
								out.println("" + i);
							} else {
								if (i > 5) {
									out.println("<a href=\"ListarUsuarios.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + (1 - 4) + "\">" + i + "</a>");
								} else {
									out.println("<a href=\"ListarUsuarios.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + 1 + "\">" + i + "</a>");
								}
							}
						}
					}
				%>

			</td>
		</tr>


	</table>

	<form action="CadastrarUsuario.jsp">
		<input type="submit" value="Novo Usuário" />

	</form>

</body>

</html>