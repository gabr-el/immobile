<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Contrato</title>
</head>
<body>
	
	<h1>Cadastrar Contrato</h1>
	
			<form action="CadastrarContrato.do" method="post" enctype="multipart/form-data">
			Dura��o em Horas: <input type="number" name="duracao_horas" /><br>
			Data de In�cio: <input type="date" name="data_inicio" /><br>
			Data Final: <input type="date" name="data_fim" /><br>
			Valor do Contrato:<input type="number" name="valor_contrato"/><br>
			Identificador do Usu�rio <input type="text" name="usuarioid"/><br/>
			Identificador do Imovel: <input type="text" name="imovelid"/><br/>
			
			<input type="file" name="file" /><br/>
		
		<input type="button" value="Voltar" onclick = "window.location.assign('ListarContratos.jsp')"/>
			
			<input type="submit" value="Salvar" />
			</form>
	
</body>
</html>