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

import immobile.dao.ImovelDao;
import immobile.model.Imovel;

/**
 * Servlet implementation class CadastraUsuario
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

@WebServlet("/CadastrarImovel.do")
public class CadastrarImovel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosImoveis";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter();
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
		int usuarioid = Integer.parseInt(request.getParameter("usuarioid"));

		System.out.println(
				"CadastrarImovel.service(" + tipo_imovel + ", " + cidade + ", " + bairro + ", " + endereco + "," + quantidade_quartos +" , " + quantidade_salas + "," + vaga_garagem + "," + piscina + "," + quantidade_pessoas + "," + disponivel + "," + titulo + "," + descricao + "," + foto + "," + usuarioid );
		
		Imovel imovel = new Imovel();
		imovel.setTipo_imovel(tipo_imovel);
		imovel.setCidade(cidade);
		imovel.setBairro(bairro);
		imovel.setEndereco(endereco);
		imovel.setQuantidade_quartos(quantidade_quartos);
		imovel.setQuantidade_salas(quantidade_salas);
		imovel.setVaga_garagem(vaga_garagem);
		imovel.setPiscina(piscina);
		imovel.setQuantidade_pessoas(quantidade_pessoas);
		imovel.setDisponivel(disponivel);
		imovel.setTitulo(titulo);
		imovel.setDescricao(descricao);
		imovel.setFoto(foto);
		imovel.setUsuarioid(usuarioid);

		ImovelDao imovelDao = new ImovelDao();
		int id = imovelDao.insert(imovel);
		
		
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
				String fileName = "imovel_" + id + "_" + (int)(Math.random()*10000) + nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
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
