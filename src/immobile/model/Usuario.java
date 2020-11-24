package immobile.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Usuario {
	private int id;
	private String cpf;
	private String nome;
	private String endereco;
	private String cidade;
	private String bairro;
	private String login;
	private String email;
	private String senha;
	private String tipo;
	private String foto;
	public Usuario() {
		super();
	}
	public Usuario(int id, String cpf, String nome, String endereco, String cidade, String bairro, String login, String email,
			String senha, String tipo, String foto) {
		super();
		this.id = id;
		this.cpf = cpf;
		this.nome = nome;
		this.endereco = endereco;
		this.cidade = cidade;
		this.bairro = bairro;
		this.login = login;
		this.email = email;
		this.senha = senha;
		this.tipo = tipo;
		this.foto = foto;
	}
	
	public Usuario(ResultSet rs) {
		super();
		try {
			this.id = rs.getInt("id");
			this.cpf = rs.getString("cpf");
			this.nome = rs.getString("nome");
			this.endereco =rs.getString("endereco");
			this.cidade = rs.getString("cidade");
			this.bairro = rs.getString("bairro");
			this.login = rs.getString("login");
			this.email = rs.getString("email");
			this.senha = rs.getString("senha");
			this.tipo = rs.getString("tipo");
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
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
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
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	@Override
	public String toString() {
		return "Usuario [cpf=" + cpf + ", nome=" + nome + ", endereco=" + endereco + ", cidade=" + cidade + ", bairro="
				+ bairro + ", login=" + login + ", email=" + email + ", senha=" + senha + ", tipo=" + tipo + ", foto " + foto +"]";
	}
	
	

}
