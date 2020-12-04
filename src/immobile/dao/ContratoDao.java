package immobile.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import immobile.model.Contrato;

public class ContratoDao {

	private Connection connection;
	private FileInputStream IMAGEM;

	public ContratoDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int insert(Contrato contrato) {
		String sql = "INSERT INTO public.contrato (duracao_horas, data_inicio, data_fim, valor_contrato, usuarioid, imovelid) VALUES (?,?,?,?,?,?)";

		java.sql.Date data_inicioSql = new java.sql.Date(contrato.getData_inicio().getTime());
		java.sql.Date data_fimSql = new java.sql.Date(contrato.getData_fim().getTime());
		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, contrato.getDuracao_horas());
			stmt.setDate(2, data_inicioSql);
			stmt.setDate(3, data_fimSql);
			stmt.setFloat(4, contrato.getValor_contrato());
			stmt.setInt(5, contrato.getUsuarioid());
			stmt.setInt(6, contrato.getImovelid());

			System.out.println(stmt.toString());

			stmt.execute();

			sql = "SELECT CURRVAL('public.contrato_id_seq') as id";

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

	public int delete(int contrato) {
		System.out.println("ContratoDao.delete(" + contrato + ")");

		String sql = ("DELETE FROM public.contrato WHERE id = ? ");
		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);

			stmt.setInt(1, contrato);

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

	public int update(Contrato contrato) {
		String sql = "UPDATE public.contrato SET duracao_horas =?, data_inicio=?, data_fim=?, valor_contrato=?, usuarioid=?, imovelid=? WHERE id=?;";
		java.sql.Date data_inicioSql = new java.sql.Date(contrato.getData_inicio().getTime());
		java.sql.Date data_fimSql = new java.sql.Date(contrato.getData_fim().getTime());
		try {
			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, contrato.getDuracao_horas());
			stmt.setDate(2, data_inicioSql);
			stmt.setDate(3, data_fimSql);
			stmt.setFloat(4, contrato.getValor_contrato());
			stmt.setInt(5, contrato.getUsuarioid());
			stmt.setInt(6, contrato.getImovelid());
			stmt.setInt(7, contrato.getId());

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

	public Contrato getContrato(int id) {
		String sql = "SELECT id, duracao_horas, data_inicio, data_fim, valor_contrato, usuarioid, imovelid FROM public.contrato WHERE id=?";

		try {

			PreparedStatement stmt = this.connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Contrato contrato = new Contrato(rs);
				return contrato;

			} else {

				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return null;

	}

	public List<Contrato> getListContrato() {
		return null;
	}

	public List<Contrato> getListaContrato(int linhas, int pagina) {
		String sql = "Select * From contrato ORDER BY id LIMIT ? OFFSET ?";
		List<Contrato> listaContrato = new ArrayList<Contrato>();

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, linhas);
			stmt.setInt(2, (linhas * pagina) - linhas);
			ResultSet rs = stmt.executeQuery();

			while (rs.next() == true) {

				Contrato contrato = new Contrato(rs);

				listaContrato.add(contrato);
			}

			return listaContrato;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}

	}

	public int totalContrato() {
		String sql = "SELECT COUNT(1) as totalContrato FROM contrato";
		int totalContrato = 0;

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				totalContrato = rs.getInt("totalContrato");

			}

			return totalContrato;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

}
