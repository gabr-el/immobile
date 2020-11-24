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

import immobile.dao.ImovelDao;
import immobile.model.Imovel;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/AlterarImovel.do")

public class AlterarImovel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosImoveis";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method post

		int id = Integer.parseInt(request.getParameter("id"));

		String tipo_imovel = request.getParameter("tipo_imovel");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String endereco = request.getParameter("endereco");
		int quantidade_quartos = Integer.parseInt(request.getParameter("quantidade_quartos"));
		int quantidade_salas = Integer.parseInt(request.getParameter("quantidade_salas"));
		int vaga_garagem = Integer.parseInt(request.getParameter("vaga_garagem"));
		boolean piscina = Boolean.parseBoolean(request.getParameter("piscina"));
		int quantidade_pessoas = Integer.parseInt(request.getParameter("quantidade_pessoas"));
		boolean disponivel = Boolean.parseBoolean(request.getParameter("disponivel"));
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String foto = request.getParameter("foto");

		Imovel imovel = new Imovel(id, tipo_imovel, cidade, bairro, endereco, quantidade_quartos, quantidade_salas, vaga_garagem, piscina, quantidade_pessoas, disponivel, titulo, descricao, foto);

		ImovelDao imovelDao = new ImovelDao();
		imovelDao.update(imovel);

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

				imovelDao.gravaPhoto(id, SAVE_DIR + "/" + fileName);
				break;
			}
		}

		response.sendRedirect("ListarImoveis.jsp");
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