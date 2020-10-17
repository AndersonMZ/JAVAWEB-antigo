package br.senai.sp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.ConexaoMySql;
import br.senai.sp.model.Contato;

public class ContatoDAO {
	
	public void gravar(Contato contato){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "INSERT INTO contato "
				+ "(nome, email, telefone,"
				+ " celular, logradouro, bairro,"
				+ " cidade, estado, cep,"
				+ " pessoa, contato, dtNasc, idUsuario) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setString(12, contato.getDtNasc());
			stm.setInt(13, contato.getIdUsuario());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Contato> listaContatos(int idUsuario){		
		ArrayList<Contato> lista = new ArrayList<>();
		Contato contato = null;
		
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "SELECT * FROM contato "
				+ "WHERE idUsuario = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				contato = new Contato();
				
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setPessoa(rs.getString("pessoa"));
				contato.setContato(rs.getString("contato"));
				contato.setDtNasc(rs.getString("dtNasc"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
				
				lista.add(contato);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public void excluir(int idContato){
		String sql = "DELETE FROM contato WHERE id = ?";
		
		try {
			PreparedStatement stm = ConexaoMySql.abrirConexao().prepareStatement(sql);
			stm.setInt(1,  idContato);
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Contato getContato(int idContato){		
		Contato contato = null;
		
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "SELECT * FROM contato "
				+ "WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idContato);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				contato = new Contato();
				
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setCelular(rs.getString("celular"));
				contato.setLogradouro(rs.getString("logradouro"));
				contato.setBairro(rs.getString("bairro"));
				contato.setCidade(rs.getString("cidade"));
				contato.setEstado(rs.getString("estado"));
				contato.setCep(rs.getString("cep"));
				contato.setPessoa(rs.getString("pessoa"));
				contato.setContato(rs.getString("contato"));
				contato.setDtNasc(rs.getString("dtNasc"));
				contato.setIdUsuario(rs.getInt("idUsuario"));
				
			}
			
			ConexaoMySql.fecharConexao();		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return contato;
	}
	
	public void editar(Contato contato){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "UPDATE contato set nome = ?, email = ?, telefone = ?, celular = ?,"
				+ " logradouro = ?, bairro = ?, cidade = ?, estado = ?, cep = ?,"
				+ " pessoa = ?, contato = ?, dtNasc = ?"
				+ " WHERE id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, contato.getNome());
			stm.setString(2, contato.getEmail());
			stm.setString(3, contato.getTelefone());
			stm.setString(4, contato.getCelular());
			stm.setString(5, contato.getLogradouro());
			stm.setString(6, contato.getBairro());
			stm.setString(7, contato.getCidade());
			stm.setString(8, contato.getEstado());
			stm.setString(9, contato.getCep());
			stm.setString(10, contato.getPessoa());
			stm.setString(11, contato.getContato());
			stm.setString(12, contato.getDtNasc());
			stm.setInt(13, contato.getId());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
