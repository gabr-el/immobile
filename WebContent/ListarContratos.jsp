<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Lista de Contratos</title>

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

	<h1>Lista de Contratos</h1>

	<table border="2">

		<tr>
			<td>Duração em Horas</td>
			<td>Data de Inicio</td>
			<td>Data de Fim</td>
			<td>Valor do Contrato</td>
			<td>Identidicador do Usuário</td>
			<td>Identificador do Imovel</td>
			
			<td colspan="2">Opções</td>
		</tr>

		<%
			ContratoDao contratoDao = new ContratoDao();
			int totalContrato = contratoDao.totalContrato();
			int totalPaginas = totalContrato / linhas;
			if ((totalContrato % linhas) > 0) {
				totalPaginas++;
			}
			List<Contrato> contratos = contratoDao.getListaContrato(linhas, paginaAtual);
			for (Contrato contrato : contratos) {
		%>

		<tr>

			<td><%=contrato.getDuracao_horas()%></td>
			<td><%=contrato.getData_inicioStr()%></td>
			<td><%=contrato.getData_fimStr()%></td>
			<td><%=contrato.getValor_contrato()%></td>
			<td><%=contrato.getUsuarioid()%></td>
			<td><%=contrato.getImovelid()%></td>
			
			<td><a href="AlterarContrato.jsp?id=<%=contrato.getId()%>">Alterar</a></td>
			<td><a href="ExcluirContrato.jsp?id=<%=contrato.getId()%>">Excluir</a></td>
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
									out.println("<a href=\"ListarContratos.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + (1 - 4) + "\">" + i + "</a>");
								} else {
									out.println("<a href=\"ListarContratos.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + 1 + "\">" + i + "</a>");
								}
							}
						}
					}
				%>

			</td>
		</tr>


	</table>

	<form action="CadastrarContratos.jsp">
		<input type="submit" value="Novo Contrato" />

	</form>

</body>

</html>