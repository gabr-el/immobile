package immobile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import immobile.dao.UsuarioDao;
import immobile.model.Usuario;

@WebServlet("/AutenticarUsuario.do")
public class AutenticarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		HttpSession sessao = request.getSession(false);

		if (sessao != null) {
			sessao.invalidate();
		}
		request.setAttribute("msg", "");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuario = new Usuario();
		usuario.setLogin(login);
		usuario.setSenha(senha);

		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuarioAutenticado = usuarioDao.autenticarUsuario(login, senha);

		if (usuarioAutenticado != null) {
			HttpSession sessao = request.getSession(true);
			sessao.setAttribute("usuarioAutenticado", usuarioAutenticado);

			sessao.setMaxInactiveInterval(60 * 5);
			request.getRequestDispatcher("ListarUsuarios.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "Login ou senha invalida!");
			request.getRequestDispatcher("AutenticarUsuario.jsp").forward(request, response);

		}
	}
}