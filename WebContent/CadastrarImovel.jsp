<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Imovel</title>
</head>
<body>
	
	<h1>Cadastrar Imovel</h1>
	
			<form action="CadastrarImovel.do" method="post" enctype="multipart/form-data">
			Tipo do Imovel: <input type="text" name="tipo_imovel" /><br>
			Cidade: <input type="text" name="cidade" /><br>
			Bairro: <input type="text" name="bairro" /><br>
			Endereço:<input type="text" name="endereco"/><br>
			Quantidade de Quartos: <input type="number" name="quantidade_quartos"/><br/>
			Quantidade de Salas: <input type="number" name="quantidade_salas"/><br/>
			Vagas de Garagem: <input type="number" name="vaga_garagem"/><br/>
			Piscina: <input type="text" name="piscina"/><br/>
			Quantidade de Pessoas: <input type="number" name="quantidade_pessoas"/><br/>
			Disponível: <input type="text" name="disponivel"/><br/>
			Título: <input type="text" name="disponivel"/><br/>
			Descrição: <input type="text" name="descricao"/><br/>
			<input type="file" name="foto" /><br/>
		
		<input type="button" value="Voltar" onclick = "window.location.assign('ListarImoveis.jsp')"/>
			
			<input type="submit" value="Salvar" />
			</form>
	
</body>
</html>