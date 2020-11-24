<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Contrato</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("id"));
	Contrato contrato = new Contrato();
	ContratoDao contratoDao = new ContratoDao();
	contrato = contratoDao.getContrato(id);
	%>

	<h1>Alterar Contrato</h1>

	<form action="AlterarContrato.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value=<%=contrato.getId()%> />
		Duração de Horas: <input type="number" name="duracao_horas" value=<%=contrato.getDuracao_horas()%> /><br>
		Data de Início: <input type="date" name="data_inicio" value=<%=contrato.getData_inicio()%> /><br>
		Data Final: <input type="date" name="data_fim" value=<%=contrato.getData_fim()%> /><br>
		Valor do Contrato: <input type="number" name="valor-contrato" value=<%=contrato.getValor_contrato()%> /><br>
		Identificador do Usuário: <input type="number" name="usuarioid" value=<%=contrato.getUsuarioid()%> /><br>
		Identificador do Imovel: <input type="number" name="imovelid" value=<%=contrato.getImovelid()%> /><br>
		  
		<input
			type="button" value="Voltar"
			onclick="window.location.assign('ListarContratos.jsp')" /> 
			<input
			type="submit" value="Salvar" />

	</form>

</body>
</html>