package immobile.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;

import immobile.dao.UsuarioDao;
import immobile.model.Usuario;

@WebServlet("/EsqueciSenha.do")
public class EsqueciSenha extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String emailSolicitado = request.getParameter("email");

		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario = usuarioDao.getUsuarioPorEmail(emailSolicitado);

		if (usuario != null) {
			EnviarEmail email = new EnviarEmail();

			String novaSenha = "";

			try {
				email.enviar("Solicitação de Restauração de Senha",
						"Caro usuário, recebemos um pedido de alteração de senha de acesso. Sua nova senha é: "
								+ novaSenha,
						emailSolicitado);

				request.setAttribute("msg", "E-mail enviado com sucesso!");
				request.getRequestDispatcher("EsqueciSenha.jsp").forward(request,

						response);
			} catch (EmailException e) {

				e.printStackTrace();
				request.setAttribute("msg", "Não foi possível enviar o e-mail de recuperação!");

				request.getRequestDispatcher("EsqueciSenha.jsp").forward(request, response);

			}

		} else {
			request.setAttribute("msg", "O e-mail digitado não existe no nosso cadastro.");

			request.getRequestDispatcher("EsqueciSenha.jsp").forward(request, response);
		}
	}
}