package immobile.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/CadastrarContrato.do")
public class CadastrarContrato extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "FotosContratos";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter();
		int duracao_horas = Integer.parseInt(request.getParameter("duracao_horas"));

		float valor_contrato = Float.parseFloat(request.getParameter("valor_contrato"));
		int usuarioid = Integer.parseInt(request.getParameter("usuarioid"));
		int imovelid = Integer.parseInt(request.getParameter("imovelid"));
		Date data_inicio = null;
		Date data_fim = null;
		System.out.println(request.getParameter("data_inicio"));
		System.out.println(request.getParameter("data_fim"));
		try {
			data_inicio = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data_inicio"));
			data_fim = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("data_fim"));
		} catch (ParseException e) {
			try {
				data_inicio = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data_inicio"));
				data_fim = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data_fim"));
			} catch (ParseException e2) {
				// throw e;
			}

		}

		System.out.println("CadastrarContrato.service(" + duracao_horas + ", " + data_inicio + ", " + data_fim + ", "
				+ valor_contrato + "," + usuarioid + " , " + imovelid + "");

		Contrato contrato = new Contrato();
		contrato.setDuracao_horas(duracao_horas);
		contrato.setData_inicio(data_inicio);
		contrato.setData_fim(data_fim);
		contrato.setValor_contrato(valor_contrato);
		contrato.setUsuarioid(usuarioid);
		contrato.setImovelid(imovelid);

		ContratoDao contratoDao = new ContratoDao();
		int id = contratoDao.insert(contrato);

		response.sendRedirect("ListarContratos.jsp");
	}

}
