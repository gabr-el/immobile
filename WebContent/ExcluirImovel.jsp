<%@page import="immobile.dao.*"%>
<%@page import="immobile.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exclusão de Imovel</title>
</head>
<body>

        <h1>Excluir Imóvel</h1>
       
          
	<%
                 		int id = Integer.parseInt(request.getParameter("id"));

                 	                 			ImovelDao imovelDao = new ImovelDao();
                 	                 			Imovel imovel = imovelDao.getImovel(id);
                 	%>
	
	
	<form action="ExcluirImovel.do" method="post">
	<input type="hidden"name="id" value="<%= imovel.getId()%>"/>
	Tipo do Imovel: <input type="text" readonly="readonly" name="tipo_imovel" value="<%= imovel.getTipo_imovel()%>"/><br>
	Cidade: <input type="text" readonly="readonly" name="cidade" value="<%= imovel.getCidade()%>"/><br>
	Bairro: <input type="text" readonly="readonly" name="bairro" value="<%= imovel.getBairro()%>"/><br>
	Endereço: <input type="text" readonly="readonly" name="endereco" value="<%= imovel.getEndereco()%>"/><br>
	Quantidade de Quartos: <input type="number" readonly="readonly" name="quantidade_quartos" value="<%= imovel.getQuantidade_quartos()%>"/><br>
	Quantidade de Salas: <input type="number" readonly="readonly" name="quantidade_salas" value="<%= imovel.getQuantidade_salas()%>"/><br>
	Vagas de Garagem: <input type="number" readonly="readonly" name="vaga_garagem" value="<%= imovel.getVaga_garagem()%>"/><br>
	Piscina: <input type="text" readonly="readonly" name="piscina" value="<%= imovel.getPiscina()%>"/><br>
	Quantidade de Pessoas: <input type="number" readonly="readonly" name="quantidade_pessoas" value="<%= imovel.getQuantidade_pessoas()%>"/><br>		
	Disponível: <input type="text" readonly="readonly" name="disponivel" value="<%= imovel.getDisponivel()%>"/><br>
	Título: <input type="text" readonly="readonly" name="titulo" value="<%= imovel.getTitulo()%>"/><br>
	Descrição: <input type="text" readonly="readonly" name="descricao" value="<%= imovel.getDescricao()%>"/><br>
	Foto:<input type="hidden" name="foto" value="<%= imovel.getFoto()%>"/><br> 
	<input type="submit" value="Excluir"/>
	


</form>
</body>
</html>
