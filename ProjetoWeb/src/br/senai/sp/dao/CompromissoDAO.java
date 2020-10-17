package br.senai.sp.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.senai.sp.jdbc.ConexaoMySql;
import br.senai.sp.model.Compromisso;

public class CompromissoDAO {
	public void gravar(Compromisso compromisso){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "INSERT INTO compromisso "
				+ "(nome, assunto, local,"
				+ " horario, data, idUsuario,"
				+ " values (?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, compromisso.getNome());
			stm.setString(2, compromisso.getAssunto());
			stm.setString(3, compromisso.getLocal());
			stm.setString(4, compromisso.getHorario());
			stm.setString(5, compromisso.getData());
			stm.setInt(6, compromisso.getIdUsuario());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Compromisso> listaCompromissos(int idUsuario){		
		ArrayList<Compromisso> lista = new ArrayList<>();
		Compromisso compromisso = null;
		
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "SELECT * FROM compromisso "
				+ "WHERE idUsuario = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idUsuario);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				compromisso = new Compromisso();
				
				compromisso.setId(rs.getInt("id"));
				compromisso.setNome(rs.getString("nome"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setHorario(rs.getString("horario"));
				compromisso.setData(rs.getString("data"));
				compromisso.setIdUsuario(rs.getInt("idUsuario"));
				
				lista.add(compromisso);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lista;
	}
	
	public void excluir(int idCompromisso){
		String sql = "DELETE FROM compromisso WHERE id = ?";
		
		try {
			PreparedStatement stm = ConexaoMySql.abrirConexao().prepareStatement(sql);
			stm.setInt(1,  idCompromisso);
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Compromisso getContato(int idContato){		
		Compromisso compromisso = null;
		
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "SELECT * FROM compromisso "
				+ "WHERE id = ?";
		
		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setInt(1, idContato);
			
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()){
				
				compromisso = new Compromisso();
				
				compromisso.setId(rs.getInt("id"));
				compromisso.setNome(rs.getString("nome"));
				compromisso.setAssunto(rs.getString("assunto"));
				compromisso.setLocal(rs.getString("local"));
				compromisso.setHorario(rs.getString("horario"));
				compromisso.setData(rs.getString("data"));
				compromisso.setIdUsuario(rs.getInt("idUsuario"));
				
			}
			
			ConexaoMySql.fecharConexao();		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return compromisso;
	}
	
	public void editar(Compromisso compromisso){
		Connection con = ConexaoMySql.abrirConexao();
		
		String sql = "UPDATE contato set nome = ?, assunto = ?, local = ?, horario = ?, data = ?"
				+ " WHERE id = ?";

		try {
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, compromisso.getNome());
			stm.setString(2, compromisso.getAssunto());
			stm.setString(3, compromisso.getLocal());
			stm.setString(4, compromisso.getHorario());
			stm.setString(5, compromisso.getData());
			stm.setInt(6, compromisso.getId());
			stm.execute();
			ConexaoMySql.fecharConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
