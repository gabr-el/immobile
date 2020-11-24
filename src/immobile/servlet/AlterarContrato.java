package immobile.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import immobile.dao.ContratoDao;
import immobile.model.Contrato;

/**
 * Servlet implementation class CadastraUsuario
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet("/AlterarContrato.do")

public class AlterarContrato extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosContratos";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method post

		int id = Integer.parseInt(request.getParameter("id"));

		int duracao_horas = Integer.parseInt(request.getParameter("duracao_horas"));

		Date data_inicio = null;
		Date data_fim = null;
		try {
			data_inicio = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data_inicio"));
			data_fim = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data_fim"));
		} catch (ParseException e) {
			// throw e;
		}

		Float valor_contrato = Float.parseFloat(request.getParameter("valor_contrato"));
		int usuarioid = Integer.parseInt(request.getParameter("usuarioid"));
		int imovelid = Integer.parseInt(request.getParameter("imovelid"));

		//

		Contrato contrato = new Contrato(id, duracao_horas, data_inicio, data_fim, valor_contrato, usuarioid, imovelid);

		ContratoDao contratoDao = new ContratoDao();
		contratoDao.update(contrato);

		String appPath = request.getServletContext().getRealPath("");

		String savePath = appPath + File.separator + SAVE_DIR;

		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		String fileName = "";
		String nomeArquivo = "";
		for (Part part : request.getParts()) {
			nomeArquivo = extractFileName(part);
			if (!nomeArquivo.equals("")) {
				fileName = "contrato_" + id + "_" + (int) (Math.random() * 10000)
						+ nomeArquivo.substring(nomeArquivo.lastIndexOf('.'));
				part.write(savePath + File.separator + fileName);

				contratoDao.gravaPhoto(id, SAVE_DIR + "/" + fileName);
				break;
			}
		}

		response.sendRedirect("ListarContratos.jsp");
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