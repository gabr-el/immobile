<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar Imóvel</title>
</head>
<body>

	<%
		int id = Integer.parseInt(request.getParameter("id"));
	Imovel imovel = new Imovel();
	ImovelDao imovelDao = new ImovelDao();
	imovel = imovelDao.getImovel(id);
	%>

	<h1>Alterar Imovel</h1>

	<form action="AlterarImovel.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value=<%=imovel.getId()%> />
		Tipo do Imóvel: <input type="text" name="tipo_imovel" value=<%=imovel.getTipo_imovel()%> /><br>
		Cidade: <input type="text" name="cidade" value=<%=imovel.getCidade()%> /><br>
		Bairro: <input type="text" name="bairro" value=<%=imovel.getBairro()%> /><br>
		Endereço: <input type="text" name="endereco" value=<%=imovel.getEndereco()%> /><br>
		Quantidade de Quartos: <input type="number" name="quantidade_quartos" value=<%=imovel.getQuantidade_quartos()%> /><br>
		Quantidade de Salas: <input type="number" name="quantidade_salas" value=<%=imovel.getQuantidade_salas()%> /><br>
		Vagas de Garagem:<input type="number" name="vagas_garagem" value=<%=imovel.getVaga_garagem()%> /><br>
		Piscina:<input type="text" name="piscina" value=<%=imovel.getPiscina()%> /><br>
		Quantidade de Pessoas: <input type="number" name="quantidade_pessoas" value=<%=imovel.getQuantidade_pessoas()%> /><br>
		Disponível: <input type="text" name="disponivel" value=<%=imovel.getDisponivel()%> /><br>
		Título: <input type="text" name="titulo" value=<%=imovel.getTitulo()%> /><br><img src="<%=imovel.getTitulo()%>">  
		Descrição: <input type="text" name="descricao" value=<%=imovel.getDescricao()%> /><br>
		Foto:<input type="file" name="foto" accept="Image/*"/><br>
		<input
			type="button" value="Voltar"
			onclick="window.location.assign('ListarImoveis.jsp')" /> 
			<input
			type="submit" value="Salvar" />

	</form>

</body>
</html>