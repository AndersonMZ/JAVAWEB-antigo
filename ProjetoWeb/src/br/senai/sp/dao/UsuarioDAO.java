package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.senai.sp.jdbc.ConexaoMySql;
import br.senai.sp.model.Usuario;

public class UsuarioDAO {

	public Usuario autenticar(String email, String senha) {
		Usuario u = null;
		String sql = "SELECT * FROM usuario " 
				+ "WHERE email = ? AND senha = ? AND ativo = 1";

		try {
			PreparedStatement stm = ConexaoMySql.abrirConexao().prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, senha);
 
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setSexo(rs.getString("sexo"));
				u.setDtNasc(rs.getString("dtNasc"));
				u.setEmail(rs.getString("email"));
				u.setCidade(rs.getString("cidade"));
				u.setTelefone(rs.getString("telefone"));
				u.setSalario(rs.getDouble("salario"));
				u.setAtivo(true);
				u.setSenha("");
			}

			ConexaoMySql.fecharConexao();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	public void gravar(Usuario usuario){

		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "INSERT INTO usuario "
				+ "(nome, sexo, senha,"
				+ " email, cidade, telefone,"
				+ " salario, dtNasc, ativo) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, 1)";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getSexo());
			stm.setString(3, usuario.getSenha());
			stm.setString(4, usuario.getEmail());
			stm.setString(5, usuario.getCidade());
			stm.setString(6, usuario.getTelefone());
			stm.setDouble(7, usuario.getSalario());
			stm.setString(8, usuario.getDtNasc());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void editar(Usuario usuario){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "UPDATE usuario set "
				+ "nome = ?, email = ?, cidade = ?, telefone = ?, "
				+ "salario = ?, dtNasc = ? where id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getNome());
			stm.setString(2, usuario.getEmail());
			stm.setString(3, usuario.getCidade());
			stm.setString(4, usuario.getTelefone());
			stm.setDouble(5, usuario.getSalario());
			stm.setString(6, usuario.getDtNasc());
			stm.setInt(7, usuario.getId());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void editarSenha(Usuario usuario){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "UPDATE usuario set "
				+ "senha = ? where id = ?";
		
		try {	
			
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, usuario.getSenha());
			stm.setInt(2, usuario.getId());
			stm.execute();
			ConexaoMySql.fecharConexao();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Usuario getUsuario(int id){		
		Usuario usuario = null;
		
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "SELECT * FROM usuario "
				+ "WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				usuario = new Usuario();
				
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setSexo(rs.getString("sexo"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setEmail(rs.getString("email"));
				usuario.setCidade(rs.getString("cidade"));
				usuario.setTelefone(rs.getString("telefone"));
				usuario.setSalario(rs.getDouble("salario"));
				usuario.setDtNasc(rs.getString("dtNasc"));
				
			}
			
			ConexaoMySql.fecharConexao();		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return usuario;
	}
}
