package immobile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import immobile.dao.ContratoDao;


/**
 * Servlet implementation class CadastraUsuario
 */
@WebServlet("/ExcluirContrato.do")
public class ExcluirContrato extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ExcluirContrato.doPost(" + request.getParameter("id") + ")");

		int id = Integer.parseInt(request.getParameter("id"));
		ContratoDao contratoDao = new ContratoDao();
		id = contratoDao.delete(id);

		response.sendRedirect("ListarContratos.jsp");
	}

}
