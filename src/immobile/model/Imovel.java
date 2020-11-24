package immobile.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Imovel {

	private int id;
	private String tipo_imovel;
	private String cidade;
	private String bairro;
	private String endereco;
	private int quantidade_quartos;
	private int quantidade_salas;
	private int vaga_garagem;
	private boolean piscina;
	private int quantidade_pessoas;
	private boolean disponivel;
	private String titulo;
	private String descricao;
	private String foto;

	public Imovel() {
		super();
	}

	public Imovel(int id, String tipo_imovel, String cidade, String bairro, String endereco, int quantidade_quartos,
			int quantidade_salas, int vaga_garagem, boolean piscina, int quantidade_pessoas, boolean disponivel,
			String titulo, String descricao, String foto) {
		super();
		this.id = id;
		this.tipo_imovel = tipo_imovel;
		this.cidade = cidade;
		this.bairro = bairro;
		this.endereco = endereco;
		this.quantidade_quartos = quantidade_quartos;
		this.quantidade_salas = quantidade_salas;
		this.vaga_garagem = vaga_garagem;
		this.piscina = piscina;
		this.quantidade_pessoas = quantidade_pessoas;
		this.disponivel = disponivel;
		this.titulo = titulo;
		this.descricao = descricao;
		this.foto = foto;
	}

	public Imovel(ResultSet rs) {
		super();
		try {
			this.id = rs.getInt("id");
			this.tipo_imovel = rs.getString("tipo_imovel");
			this.cidade = rs.getString("cidade");
			this.bairro = rs.getString("bairro");
			this.endereco = rs.getString("endereco");
			this.quantidade_quartos = rs.getInt("quantidade_quartos");
			this.quantidade_salas = rs.getInt("quantidade_salas");
			this.vaga_garagem = rs.getInt("vaga_garagem");
			this.piscina = rs.getBoolean("piscina");
			this.quantidade_pessoas = rs.getInt("quantidade_pessoas");
			this.disponivel = rs.getBoolean("disponivel");
			this.titulo = rs.getString("titulo");
			this.descricao = rs.getString("descricao");
			this.foto = rs.getString("foto");
		
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

	public String getTipo_imovel() {
		return tipo_imovel;
	}

	public void setTipo_imovel(String tipo_imovel) {
		this.tipo_imovel = tipo_imovel;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public int getQuantidade_quartos() {
		return quantidade_quartos;
	}

	public void setQuantidade_quartos(int quantidade_quartos) {
		this.quantidade_quartos = quantidade_quartos;
	}

	public int getQuantidade_salas() {
		return quantidade_salas;
	}

	public void setQuantidade_salas(int quantidade_salas) {
		this.quantidade_salas = quantidade_salas;
	}

	public int getVaga_garagem() {
		return vaga_garagem;
	}

	public void setVaga_garagem(int vaga_garagem) {
		this.vaga_garagem = vaga_garagem;
	}

	public boolean getPiscina() {
		return piscina;
	}

	public void setPiscina(boolean piscina) {
		this.piscina = piscina;
	}

	public int getQuantidade_pessoas() {
		return quantidade_pessoas;
	}

	public void setQuantidade_pessoas(int quantidade_pessoas) {
		this.quantidade_pessoas = quantidade_pessoas;
	}

	public boolean getDisponivel() {
		return disponivel;
	}

	public void setDisponivel(boolean disponivel) {
		this.disponivel = disponivel;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	@Override
	public String toString() {
		return "Imovel [id=" + id + ", tipo_imovel=" + tipo_imovel + ", cidade=" + cidade + ", bairro=" + bairro
				+ ", endereco=" + endereco + ", quantidade_quartos=" + quantidade_quartos + ", quantidade_salas="
				+ quantidade_salas + ", vaga_garagem=" + vaga_garagem + ", piscina=" + piscina + ", quantidade_pessoas="
				+ quantidade_pessoas + ", disponivel=" + disponivel + ", titulo=" + titulo + ", descricao=" + descricao
				+ ", foto=" + foto + "]";
	}

}
