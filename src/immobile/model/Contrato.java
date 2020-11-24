package immobile.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Contrato {
	private int id;
	private int duracao_horas;
	private Date data_inicio;
	private Date data_fim;
	private float valor_contrato;
	private int usuarioid;
	private int imovelid;
	
	public Contrato() {
		super();
	}

	public Contrato(int id, int duracao_horas, Date data_inicio, Date data_fim, float valor_contrato, int usuarioid, int imovelid) {
		super();
		this.id = id;
		this.duracao_horas = duracao_horas;
		this.data_inicio = data_inicio;
		this.data_fim = data_fim;
		this.valor_contrato = valor_contrato;
		this.usuarioid = usuarioid;
		this.imovelid = imovelid;
		
	}
	
	public Contrato(ResultSet rs) {
		super();
		try {
			this.id = rs.getInt("id");
			this.duracao_horas = rs.getInt("duracao_horas");
			this.data_inicio =rs.getDate("data_inicio");
			this.data_fim = rs.getDate("date_fim");
			this.valor_contrato = rs.getFloat("valor_contrato");
			this.usuarioid = rs.getInt("usuarioid");
			this.imovelid = rs.getInt("imovelid");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDuracao_horas() {
		return duracao_horas;
	}

	public void setDuracao_horas(int duracao_horas) {
		this.duracao_horas = duracao_horas;
	}

	public Date getData_inicio() {
		return data_inicio;
	}

	public void setData_inicio(Date data_inicio) {
		this.data_inicio = data_inicio;
	}

	public Date getData_fim() {
		return data_fim;
	}

	public void setData_fim(Date data_fim) {
		this.data_fim = data_fim;
	}

	public float getValor_contrato() {
		return valor_contrato;
	}

	public void setValor_contrato(float valor_contrato) {
		this.valor_contrato = valor_contrato;
	}

	public int getUsuarioid() {
		return usuarioid;
	}

	public void setUsuarioid(int usuarioid) {
		this.usuarioid = usuarioid;
	}
	
	public int getImovelid() {
		return imovelid;
	}

	public void setImovelid(int imovelid) {
		this.imovelid = imovelid;
	}

	@Override
	public String toString() {
		return "Contrato [id=" + id + ", duracao_horas=" + duracao_horas + ", data_inicio=" + data_inicio
				+ ", data_fim=" + data_fim + ", valor_contrato=" + valor_contrato + ", usuarioid=" + usuarioid + ", imovelid=" + imovelid + "]";
	}
	
}