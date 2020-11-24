package immobile.servlet;

import java.io.File;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import immobile.dao.UsuarioDao;
import immobile.model.Usuario;

/**
 * Servlet implementation class CadastraUsuario
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/CadastrarUsuario.do")
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosUsuarios";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter();
		String cpf = request.getParameter("cpf");
		String nome = request.getParameter("nome");
		String endereco = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String tipo = request.getParameter("tipo");
		String foto = request.getParameter("foto");

		System.out.println(
				"CadastrarUsuario.service(" + cpf + ", " + nome + ", " + endereco + ", " + cidade + "," + bairro +" , " + login + "," + email + "," + senha + "," + tipo + "," + foto + "");
		
		Usuario usuario = new Usuario();
		usuario.setCpf(cpf);
		usuario.setNome(nome);
		usuario.setEndereco(endereco);
		usuario.setCidade(cidade);
		usuario.setBairro(bairro);
		usuario.setLogin(login);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		usuario.setTipo(tipo);
		usuario.setFoto(foto);

		UsuarioDao usuarioDao = new UsuarioDao();
		int id = usuarioDao.insert(usuario);
		
		
		String appPath = request.getServletContext().getRealPath("");
		
		String savePath = appPath + File.separator + SAVE_DIR;
		
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String nomeArquivo = "";
		for (Part part : request.getParts()) {
			nomeArquivo = extractFileName(part);
			if (!nomeArquivo.equals("")) {
				String fileName = "usuario_" + id + "_" + (int)(Math.random()*10000) + nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
				part.write(savePath + File.separator + fileName);

				usuarioDao.gravaPhoto(id, SAVE_DIR + "/" + fileName);
				break;
			}
		}

		response.sendRedirect("ListarUsuarios.jsp");
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
