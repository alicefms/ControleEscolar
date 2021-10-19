package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Infra.Conexao;

public class Professor {

    public Professor(int codProfessor, String nomeProfessor, boolean ativo) {
		this.codProfessor = codProfessor;
		this.nomeProfessor = nomeProfessor;
		this.ativo = ativo;
	}

	public Professor() {
    }

    public int getCodProfessor() {
		return codProfessor;
	}

	public void setCodProfessor(int codProfessor) {
		this.codProfessor = codProfessor;
	}

	public String getNomeProfessor() {
		return nomeProfessor;
	}

	public void setNomeProfessor(String nomeProfessor) {
		this.nomeProfessor = nomeProfessor;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public int codProfessor;

    public String nomeProfessor;

    public boolean ativo;

    private Conexao conexao;
    String query = "";
    
    public void incluirProfessor(String nome, boolean ativo) throws SQLException, ClassNotFoundException {
       query ="insert into professor(nomProfessor, ativo) values (?,?)";
       
		try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setString(1, nome);
        	stm.setBoolean(2, ativo);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
        
    }

    public void alterarNomeProfessor(int id, String novoNome) throws SQLException, ClassNotFoundException {
    	query= "update professor set nomProfessor = ? where codProfessor = ?";
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setString(1, novoNome);
        	stm.setInt(2, id);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
        
    }

    public List<Professor> consultarProfessores() throws SQLException, ClassNotFoundException {
    	query="select * from professor";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet resultset = stm.executeQuery();
    		List<Professor> professores = new ArrayList<>();
    		while(resultset.next()) {
    			Professor p = new Professor(
    					resultset.getInt("codProfessor"),
    					resultset.getString("nomProfessor"),
    					resultset.getBoolean("ativo")
    					);
    			professores.add(p);
    		}
    		return professores;
    	}catch (SQLException e) {
    		throw e;
    	}
        
    }

    public void alterarStatusProfessor(int id, boolean novoEstado) throws SQLException, ClassNotFoundException {
    	query= "update professor set ativo = ? where codProfessor = ?";
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setBoolean(1, novoEstado);
        	stm.setInt(2, id);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }

}