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

		float valor_contrato = Float.parseFloat(request.getParameter("valor_contrato"));
		int usuarioid = Integer.parseInt(request.getParameter("usuarioid"));
		int imovelid = Integer.parseInt(request.getParameter("imovelid"));

		//

		Contrato contrato = new Contrato(id, duracao_horas, data_inicio, data_fim, valor_contrato, usuarioid, imovelid);

		ContratoDao contratoDao = new ContratoDao();
		contratoDao.update(contrato);

		response.sendRedirect("ListarContratos.jsp");
	}

}