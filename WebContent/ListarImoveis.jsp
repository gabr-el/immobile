<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="immobile.model.*"%>
<%@ page import="immobile.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<script>
        $(document).ready(function(){
          $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myDiv div").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
    </script>

<title>Immobile</title>
</head>
<body>
	<nav class="navbar  navbar-inverse" style="background-color: #000000;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a href="ListarImoveis.jsp"><img src="imagem/Capturar.PNG"
				style="height: 40px;"></a>
			<button class="navbar-toggler-icon" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>

		<div id="navbarCollapse" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><input class="form-control mr-sm-2" id="myInput" type="text" placeholder="Procurar..." style="margin-top:8px;"></li>
				<li class="nav-item"><a class="nav-link" href="CadastrarImovel.jsp">Cadastrar Imóvel</a>
				<li class="nav-item active"><a class="nav-link"
					href="AutenticarUsuario.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AutenticarUsuario.jsp">Sair</a></li>
			</ul>
		</div>
	</nav>

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

	<%
		ImovelDao imovelDao = new ImovelDao();
	int totalImovel = imovelDao.totalImovel();
	int totalPaginas = totalImovel / linhas;
	if ((totalImovel % linhas) > 0) {
		totalPaginas++;
	}
	List<Imovel> imoveis = imovelDao.getListaImovel(linhas, paginaAtual);
	for (Imovel imovel : imoveis) {
	%>
	
<div id="myDiv" class="box" >
  <div class="col-md-4">
    <div class="thumbnail">
      <a href="ExibirImovel.jsp">
        <img src="<%=imovel.getFoto()%>" alt="imovel" style="width:100%">
        <div class="caption">
          <p><%=imovel.getTitulo()%></p>
        </div>
      </a>
   	
	<tr>
		<td><a href="AlterarImovel.jsp?id=<%=imovel.getId()%>" type="button" class="btn btn-default">Alterar</a></td>
		<td><a href="ExcluirImovel.jsp?id=<%=imovel.getId()%>" type="button" class="btn btn-danger">Excluir</a></td>
	</tr>
	 </div>
	  </div>
  </div>
	<%
		}
	%>
	<nav aria-label="Navegação de página exemplo">
	<tr class="pagination">
		<td class="page-item"><a class="page-link" href="#" >
			<%
				for (int i = paginaInicial; i <= paginaInicial + 9; i++) {
				if (i <= totalPaginas) {
					if (i == paginaAtual) {
				out.println("" + i);
					} else {
				if (i > 5) {
					out.println("<a href=\"ListarImovel.jsp?linhas=" + linhas + "&paginaAtual=" + i + "&paginaInicial="
							+ (1 - 4) + "\">" + i + "</a>");
				} else {
					out.println("<a href=\"ListarImovel.jsp?linhas=" + linhas + "&paginaAtual=" + i + "&paginaInicial=" + 1
							+ "\">" + i + "</a>");
				}
					}
				}
			}
			%>

		</a></td>
	</tr>
	</nav>

	<br>
	<br>
	<br>
	<footer class="footer navbar-fixed-bottom" style="text-align:center;"><strong>&copy;
		2020 Immobile Desenvolvido por:<br> Gilmar, José Carlos & Gabriel
	</strong></footer>

</body>

</html>