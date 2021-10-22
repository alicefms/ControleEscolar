package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Infra.Conexao;

public class Disciplina {

    public Disciplina(int codDisciplina, int codProfessor, String descDisciplina, int cargaHoraria, boolean ativa) {
		super();
		this.codDisciplina = codDisciplina;
		this.codProfessor = codProfessor;
		this.descDisciplina = descDisciplina;
		this.cargaHoraria = cargaHoraria;
		this.ativa = ativa;
	}

	public Disciplina(int codProfessor, String descDisciplina, int cargaHoraria, boolean ativa) {
		
		this.codProfessor = codProfessor;
		this.descDisciplina = descDisciplina;
		this.cargaHoraria = cargaHoraria;
		this.ativa = ativa;
	}

	public int getCodDisciplina() {
		return codDisciplina;
	}

	public void setCodDisciplina(int codDisciplina) {
		this.codDisciplina = codDisciplina;
	}

	public int getCodProfessor() {
		return codProfessor;
	}

	public void setCodProfessor(int codProfessor) {
		this.codProfessor = codProfessor;
	}

	public String getDescDisciplina() {
		return descDisciplina;
	}

	public void setDescDisciplina(String descDisciplina) {
		this.descDisciplina = descDisciplina;
	}

	public int getCargaHoraria() {
		return cargaHoraria;
	}

	public void setCargaHoraria(int cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}

	public boolean isAtiva() {
		return ativa;
	}

	public void setAtiva(boolean ativa) {
		this.ativa = ativa;
	}

	public Disciplina() {
    }

    public int codDisciplina;

    public int codProfessor;

    public String descDisciplina;

    public int cargaHoraria;

    public boolean ativa;
    
    private Conexao conexao;
    String query = "";

    public void incluirDisciplina(int cProf, String descricao, int cargaHoraria, boolean ativa) throws ClassNotFoundException, SQLException {
        query = "insert into Disciplina(codProfessor, descDisciplina, cargaHoraria, ativa) values (?,?,?,?)";
        try {
        	conexao = new Conexao();
        	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setInt(1, cProf);
        	stm.setString(2, descricao);
        	stm.setInt(3, cargaHoraria);
        	stm.setBoolean(4, ativa);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e) {
        	this.conexao.rollback();
        	throw e;
        }
    }

    public void alterarDisciplina(int cDisciplina, int cProf, String descricao, int cargaHoraria, boolean ativa) throws ClassNotFoundException, SQLException {
    	query= "update Disciplina set codProfessor = ?, descDisciplina = ?, cargaHoraria = ?, ativa =?   where codDisciplina = ?";
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
	       	stm.setInt(1, cProf);
        	stm.setString(2, descricao);
        	stm.setInt(3, cargaHoraria);
        	stm.setBoolean(4, ativa);
        	stm.setInt(5, cDisciplina );
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }

    public List<Disciplina> consultarDisciplinas() throws SQLException, ClassNotFoundException {
    	query="select * from Disciplina";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet resultset = stm.executeQuery();
    		List<Disciplina> disciplinas = new ArrayList<>();
    		while(resultset.next()) {
    			Disciplina p = new Disciplina(
    					resultset.getInt("codDisciplina"),
    					resultset.getInt("codProfessor"),
    					resultset.getString("descDisciplina"),
    					resultset.getInt("cargaHoraria"),
    					resultset.getBoolean("ativa")
    					);
    			disciplinas.add(p);
    		}
    		return disciplinas;
    	}catch (SQLException e) {
    		throw e;
    	}
    }

    
    public String getDescById(int id) throws ClassNotFoundException, SQLException {
    	query="select descDisciplina from Disciplina where codDisciplina = ?";
    	String descDisciplina ="";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		stm.setInt(1, id);
    		ResultSet res = stm.executeQuery();
    		if(res.next()) {
    			descDisciplina = res.getString("descDisciplina");
    		}
    		return descDisciplina;
    	}catch (SQLException e) {
    		throw e;
    	}
    }
    
    public void alterarStatusDisciplina(int id, boolean estadoAnterior) throws SQLException, ClassNotFoundException {
    	query= "update Disciplina set ativa = ? where codDisciplina = ?";
    	if (estadoAnterior == true) estadoAnterior = false;
    	else estadoAnterior = true;
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setBoolean(1, estadoAnterior);
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
    
    public ResultSet diciplinaCargaHoraria() throws SQLException, ClassNotFoundException {
    	query="select descDisciplina , cargaHoraria from disciplina d";
    	
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet res = stm.executeQuery();
    		return res;
    		
    	}catch (SQLException e) {
    		throw e;
    	}
    }
    

    public void calcularMedias() {
        // TODO implement here
    }

}