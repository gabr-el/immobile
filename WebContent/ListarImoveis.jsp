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

	<h1>Lista de Imoveis</h1>

	<table border="2">

		<tr>
			<td>Tipo do Imovel</td>
			<td>Cidade</td>
			<td>Bairro</td>
			<td>Endereço</td>
			<td>Quantidade de Quartos</td>
			<td>Quantidade de Salas</td>
			<td>Vagas de Garagem</td>
			<td>Piscina</td>
			<td>Quantidade de Pessoas</td>
			<td>Disponível</td>
			<td>Título</td>
			<td>Descrição</td>
			<td colspan="2">Opções</td>
		</tr>

		<%
			ImovelDao imovelDao = new ImovelDao();
			int totalImovel = imovelDao.totalImovel();
			int totalPaginas = totalImovel / linhas;
			if ((totalImovel % linhas) > 0) {
				totalPaginas++;
			}
			List<Imovel> imoveis = imovelDao.getListaImovel(linhas, paginaAtual);
			for (Imovel imovel: imoveis) {
		%>

		<tr>

			<td><%=imovel.getTipo_imovel()%></td>
			<td><%=imovel.getCidade()%></td>
			<td><%=imovel.getBairro()%></td>
			<td><%=imovel.getEndereco()%></td>
			<td><%=imovel.getQuantidade_quartos()%></td>
			<td><%=imovel.getQuantidade_salas()%></td>
			<td><%=imovel.getVaga_garagem()%></td>
			<td><%=imovel.getPiscina()%></td>
			<td><%=imovel.getQuantidade_pessoas()%></td>
			<td><%=imovel.getDisponivel()%></td>
			<td><%=imovel.getTitulo()%></td>
			<td><%=imovel.getDescricao()%></td>
			<td><img src="<%=imovel.getFoto()%>" width="200"
				height="50" /><br></td>
			<td><a href="AlterarImovel.jsp?id=<%=imovel.getId()%>">Alterar</a></td>
			<td><a href="ExcluirImovel.jsp?id=<%=imovel.getId()%>">Excluir</a></td>
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
									out.println("<a href=\"ListarImovel.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + (1 - 4) + "\">" + i + "</a>");
								} else {
									out.println("<a href=\"ListarImovel.jsp?linhas=" + linhas + "&paginaAtual=" + i
											+ "&paginaInicial=" + 1 + "\">" + i + "</a>");
								}
							}
						}
					}
				%>

			</td>
		</tr>


	</table>

	<form action="CadastrarImovel.jsp">
		<input type="submit" value="Novo Imovel" />

	</form>

</body>

</html>