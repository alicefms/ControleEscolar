package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Infra.Conexao;

public class Notas {

    public Notas(int codNota, int codAluno, int codDisciplina, float vlrNota) {
		super();
		this.codNota = codNota;
		this.codAluno = codAluno;
		this.codDisciplina = codDisciplina;
		this.vlrNota = vlrNota;
	}

	public int getCodNota() {
		return codNota;
	}

	public void setCodNota(int codNota) {
		this.codNota = codNota;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public void setCodAluno(int codAluno) {
		this.codAluno = codAluno;
	}

	public int getCodDisciplina() {
		return codDisciplina;
	}

	public void setCodDisciplina(int codDisciplina) {
		this.codDisciplina = codDisciplina;
	}

	public float getVlrNota() {
		return vlrNota;
	}

	public void setVlrNota(float vlrNota) {
		this.vlrNota = vlrNota;
	}

	public Notas() {
    }

    public int codNota;

    public int codAluno;

    public int codDisciplina;

    public float vlrNota;

    private Conexao conexao;
    String query = "";
    
    public void incluirNota(int codAluno, int codDisc, float notaValor) throws ClassNotFoundException, SQLException {
    	String query ="insert into notas(codAluno, codDisciplina, vlrNota) values (?,?,?)";
        
		try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setInt(1, codAluno);
        	stm.setInt(2,codDisc);
        	stm.setFloat(3, notaValor);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }

    public void alterarNota(int id, float novaNota) throws SQLException, ClassNotFoundException {
    	query= "update notas set vlrNota = ? where codNota = ?";
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setFloat(1, novaNota);
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

    public void excluirNota(int id) throws SQLException, ClassNotFoundException {
    	 query= "delete from notas where codNota = ?";
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setInt(1, id);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }

    public List<Notas> consultarNota() throws SQLException, ClassNotFoundException {
    	query="select * from notas";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet resultset = stm.executeQuery();
    		List<Notas> listaNotas = new ArrayList<>();
    		while(resultset.next()) {
    			Notas n = new Notas(
    					resultset.getInt("codNota"),
    					resultset.getInt("codAluno"),
    					resultset.getInt("codDisciplina"),
    					resultset.getFloat("vlrNota")
    					);
    			listaNotas.add(n);
    		}
    		return listaNotas;
    	}catch (SQLException e) {
    		throw e;
    	}
        
    }

}