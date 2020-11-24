package immobile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import immobile.dao.UsuarioDao;

/**
 * Servlet implementation class CadastraUsuario
 */
@WebServlet("/ExcluirUsuario.do")
public class ExcluirUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ExcluirUsuario.doPost(" + request.getParameter("id") + ")");

		int id = Integer.parseInt(request.getParameter("id"));
		UsuarioDao usuarioDao = new UsuarioDao();
		id = usuarioDao.delete(id);

		response.sendRedirect("ListarUsuarios.jsp");
	}

}
