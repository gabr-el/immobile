<%@page import="immobile.dao.*"%>
<%@page import="immobile.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exclusão de Contrato</title>
</head>
<body>

        <h1>Excluir Contrato</h1>
       
          
	<%
                 		int id = Integer.parseInt(request.getParameter("id"));

                 	                 			ContratoDao contratoDao = new ContratoDao();
                 	                 			Contrato contrato = contratoDao.getContrato(id);
                 	%>
	
	
	<form action="ExcluirContrato.do" method="post">
	<input type="hidden"name="id" value="<%= contrato.getId()%>"/>
	Duração em Horas: <input type="number" readonly="readonly" name="duracao_horas" value="<%= contrato.getDuracao_horas()%>"/><br>
	Data de Início: <input type="date" readonly="readonly" name="data_inicio" value="<%= contrato.getData_inicio()%>"/><br>
	Data Final: <input type="date" readonly="readonly" name="data_fim" value="<%= contrato.getData_fim()%>"/><br>
	Valor do Contrato: <input type="number" readonly="readonly" name="valor_contrato" value="<%= contrato.getValor_contrato()%>"/><br>
	Identificador do Usuário: <input type="number" readonly="readonly" name="usuarioid" value="<%= contrato.getUsuarioid()%>"/><br>
	Identificador do Imóvel: <input type="number" readonly="readonly" name="imovelid" value="<%= contrato.getImovelid()%>"/><br>
	
	<input type="submit" value="Excluir"/>
	


</form>
</body>
</html>
