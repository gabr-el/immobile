package immobile.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import immobile.dao.*;
import immobile.model.*;

/**
 * Servlet implementation class CadastraUsuario
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/AlterarUsuario.do")

public class AlterarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosUsuarios";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method post

		int id = Integer.parseInt(request.getParameter("id"));

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

		Usuario usuario = new Usuario(id, cpf, nome, endereco, cidade, bairro, login, email, senha, tipo, foto);

		UsuarioDao usuarioDao = new UsuarioDao();
		usuarioDao.update(usuario);

		// Pega o path absoluto da aplicação web
		String appPath = request.getServletContext().getRealPath("");
		// Constroi o path do diretório para salvar o arquivo
		String savePath = appPath + File.separator + SAVE_DIR;
		// cria o diretório
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		// cria o arquivo da imagem no servidor
		String fileName = "";
		String nomeArquivo = "";
		for (Part part : request.getParts()) {
			nomeArquivo = extractFileName(part);
			if (!nomeArquivo.equals("")) {
				fileName = "usuario_" + id + "_" + (int) (Math.random() * 10000)
						+ nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
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