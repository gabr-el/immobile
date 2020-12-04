package immobile.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import immobile.model.Usuario;

public class UsuarioDao {

	private Connection connection;
	private FileInputStream IMAGEM;

	public UsuarioDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int insert(Usuario usuario) {
		String sql = "INSERT INTO public.usuario (nome, cpf, endereco, cidade, bairro, login, email, senha, tipo, foto) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getCpf());
			stmt.setString(3, usuario.getEndereco());
			stmt.setString(4, usuario.getCidade());
			stmt.setString(5, usuario.getBairro());
			stmt.setString(6, usuario.getLogin());
			stmt.setString(7, usuario.getEmail());
			stmt.setString(8, usuario.getSenha());
			stmt.setString(9, usuario.getTipo());
			stmt.setString(10, usuario.getFoto());

			System.out.println(stmt.toString());

			stmt.execute();

			sql = "SELECT CURRVAL('public.usuario_id_seq') as id";

			stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				return rs.getInt("id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;

	}

	public int delete(int usuario) {
		System.out.println("UsuarioDao.delete(" + usuario + ")");

		String sql = ("DELETE FROM public.usuario WHERE id = ? ");
		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setInt(1, usuario);

			System.out.println(stmt.toString());

			if (stmt.executeUpdate() > 0) {
				return 1;

			} else {

				return 0;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return 0;

	}

	public int update(Usuario usuario) {
		String sql = "UPDATE public.usuario SET nome=?, cpf=?, endereco=?, cidade=?, bairro=?, login=?, email=?, senha=?, tipo=? WHERE id=?;";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, usuario.getNome());
			stmt.setString(2, usuario.getCpf());
			stmt.setString(3, usuario.getEndereco());
			stmt.setString(4, usuario.getCidade());
			stmt.setString(5, usuario.getBairro());
			stmt.setString(6, usuario.getLogin());
			stmt.setString(7, usuario.getEmail());
			stmt.setString(8, usuario.getSenha());
			stmt.setString(9, usuario.getTipo());
			stmt.setInt(10, usuario.getId());

			if (stmt.executeUpdate() > 0) {
				return 1;
			} else {
				return 0;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return 0;
	}

	public Usuario getUsuario(int id) {
		String sql = "SELECT id, nome, cpf, endereco, cidade, bairro, login, email, senha, tipo, foto FROM public.usuario WHERE id=?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Usuario usuario = new Usuario(rs);
				return usuario;

			} else {

				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;

	}

	public List<Usuario> getListUsuario() {
		return null;
	}

	public List<Usuario> getListaUsuarios(int linhas, int pagina) {
		String sql = "Select * From usuario ORDER BY id LIMIT ? OFFSET ?";
		List<Usuario> listaUsuarios = new ArrayList<Usuario>();

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, linhas);
			stmt.setInt(2, (linhas * pagina) - linhas);
			ResultSet rs = stmt.executeQuery();

			while (rs.next() == true) {

				Usuario usuario = new Usuario(rs);

				listaUsuarios.add(usuario);
			}

			return listaUsuarios;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}

	public int totalUsuarios() {
		String sql = "SELECT COUNT(1) as totalUsuarios FROM usuario";
		int totalUsuarios = 0;

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				totalUsuarios = rs.getInt("totalUsuarios");

			}

			return totalUsuarios;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	public int gravaPhoto(int id, String foto) {

		String sql = "UPDATE usuario SET foto=? WHERE id =?";
		try {
			// prepared statement para inserção
			PreparedStatement stmt = connection.prepareStatement(sql);
			// seta os valores
			stmt.setString(1, foto);
			stmt.setInt(2, id);
			// executa
			return stmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	public Usuario autenticarUsuario(String login, String senha) {
		String sql = "SELECT * FROM usuario WHERE login = ? and senha = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setString(1, login);
			stmt.setString(2, senha);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Usuario usuario = new Usuario(rs.getInt("id"), rs.getString("nome"), rs.getString("cpf"),
						rs.getString("endereco"), rs.getString("cidade"), rs.getString("bairro"), rs.getString("login"),
						rs.getString("email"), rs.getString("senha"), rs.getString("tipo"), rs.getString("foto"));

				return usuario;
			} else {

				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		

	}
	public Usuario getUsuarioPorEmail(String email) {
		String sql = "SELECT id, nome, cpf, endereco, cidade, bairro, login, email, senha, tipo, foto FROM public.usuario WHERE email=?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, email);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Usuario usuario = new Usuario(rs);
				return usuario;

			} else {

				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;

	}

}
