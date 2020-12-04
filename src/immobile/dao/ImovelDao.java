package immobile.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import immobile.model.Imovel;

public class ImovelDao {

	private Connection connection;
	private FileInputStream IMAGEM;

	public ImovelDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int insert(Imovel imovel) {
		String sql = "INSERT INTO public.imovel (tipo_imovel, cidade, bairro, endereco, quantidade_quartos, quantidade_salas, vaga_garagem, piscina, quantidade_pessoas, disponivel, titulo, descricao, foto, usuarioid) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, imovel.getTipo_imovel());
			stmt.setString(2, imovel.getCidade());
			stmt.setString(3, imovel.getBairro());
			stmt.setString(4, imovel.getEndereco());
			stmt.setInt(5, imovel.getQuantidade_quartos());
			stmt.setInt(6, imovel.getQuantidade_salas());
			stmt.setInt(7, imovel.getVaga_garagem());
			stmt.setBoolean(8, imovel.getPiscina());
			stmt.setInt(9, imovel.getQuantidade_pessoas());
			stmt.setBoolean(10, imovel.getDisponivel());
			stmt.setString(11, imovel.getTitulo());
			stmt.setString(12, imovel.getDescricao());
			stmt.setString(13, imovel.getFoto());
			stmt.setInt(14, imovel.getUsuarioid());

			System.out.println(stmt.toString());

			stmt.execute();

			sql = "SELECT CURRVAL('public.imovel_id_seq') as id";

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

	public int delete(int imovel) {
		System.out.println("ImovelDao.delete(" + imovel + ")");

		String sql = ("DELETE FROM public.imovel WHERE id = ? ");
		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setInt(1, imovel);

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

	public int update(Imovel imovel) {
		String sql = "UPDATE public.imovel SET tipo_imovel=?, cidade=?, bairro=?, endereco=?, quantidade_quartos=?, quantidade_salas=?, vaga_garagem=?, piscina=?, quantidade_pessoas=?, disponivel=?, titulo=?, descricao=?, usuarioid=? WHERE id=?;";

		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setString(1, imovel.getTipo_imovel());
			stmt.setString(2, imovel.getCidade());
			stmt.setString(3, imovel.getBairro());
			stmt.setString(4, imovel.getEndereco());
			stmt.setInt(5, imovel.getQuantidade_quartos());
			stmt.setInt(6, imovel.getQuantidade_salas());
			stmt.setInt(7, imovel.getVaga_garagem());
			stmt.setBoolean(8, imovel.getPiscina());
			stmt.setInt(9, imovel.getQuantidade_pessoas());
			stmt.setBoolean(10, imovel.getDisponivel());
			stmt.setString(11, imovel.getTitulo());
			stmt.setString(12, imovel.getDescricao());
			stmt.setInt(13, imovel.getUsuarioid());
			stmt.setInt(14, imovel.getId());
			
			if (stmt.executeUpdate() > 0) {
				return 1;
			} else {
				return 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	public Imovel getImovel(int id) {
		String sql = "SELECT id, tipo_imovel, cidade, bairro, endereco, quantidade_quartos, quantidade_salas, vaga_garagem, piscina, quantidade_pessoas, disponivel, titulo, descricao, foto, usuarioid from public.imovel WHERE id=?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Imovel imovel = new Imovel(rs);
				return imovel;

			} else {

				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;

	}

	public List<Imovel> getListImovel() {
		return null;
	}

	public List<Imovel> getListaImovel(int linhas, int pagina) {
		String sql = "Select * From imovel ORDER BY id LIMIT ? OFFSET ?";
		List<Imovel> listaImovel = new ArrayList<Imovel>();

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, linhas);
			stmt.setInt(2, (linhas * pagina) - linhas);
			ResultSet rs = stmt.executeQuery();

			while (rs.next() == true) {

				Imovel imovel = new Imovel(rs);

				listaImovel.add(imovel);
			}

			return listaImovel;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}

	public int totalImovel() {
		String sql = "SELECT COUNT(1) as totalImovel FROM imovel";
		int totalImovel = 0;

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				totalImovel = rs.getInt("totalImovel");

			}

			return totalImovel;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	public int gravaPhoto(int id, String foto) {

		String sql = "UPDATE imovel SET foto=? WHERE id =?";
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
}
