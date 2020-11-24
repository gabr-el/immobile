<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Usuário</title>
</head>
<body>
	
	<h1>Cadastrar Usuario</h1>
	
			<form action="CadastrarUsuario.do" method="post" enctype="multipart/form-data">
			Cpf: <input type="number" name="cpf" /><br>
			Nome: <input type="text" name="nome" /><br>
			Endereço: <input type="text" name="endereco" /><br>
			Cidade:<input type="text" name="cidade"/><br>
			Bairro: <input type="text" name="bairro"/><br/>
			Login: <input type="text" name="login"/><br/>
			Email: <input type="text" name="email"/><br/>
			Senha: <input type="password" name="senha"/><br/>
			Tipo de Usuário <input type="text" name="tipo"/><br/>
			<input type="file" name="foto" /><br/>
		
		<input type="button" value="Voltar" onclick = "window.location.assign('ListarUsuarios.jsp')"/>
			
			<input type="submit" value="Salvar" />
			</form>
	
</body>
</html>