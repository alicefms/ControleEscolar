package Model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Infra.Conexao;

public class Matricula {

    public Matricula(int codMatricula, int codAluno, int codDisciplina, Date dataMatricula) {
		super();
		this.codMatricula = codMatricula;
		this.codAluno = codAluno;
		this.codDisciplina = codDisciplina;
		this.dataMatricula = dataMatricula;
	}

	public Matricula(int codAluno, int codDisciplina, Date dataMatricula) {
		super();
		this.codAluno = codAluno;
		this.codDisciplina = codDisciplina;
		this.dataMatricula = dataMatricula;
	}

	public int getCodMatricula() {
		return codMatricula;
	}

	public void setCodMatricula(int codMatricula) {
		this.codMatricula = codMatricula;
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

	public Date getDataMatricula() {
		return dataMatricula;
	}

	public void setDataMatricula(Date dataMatricula) {
		this.dataMatricula = dataMatricula;
	}

	public Matricula() {
    }

    public int codMatricula;

    public int codAluno;

    public int codDisciplina;

    public Date dataMatricula;


    private Conexao conexao;
    String query = "";
    public void gerarMatricula(int codAluno, int codDisciplina, Date dataMatricula) throws ClassNotFoundException, SQLException {
    	  query = "insert into Matricula(codAluno, codDisciplina, dataMatricula ) values (?,?,?)";
          try {
          	conexao = new Conexao();
          	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
          	stm.setInt(1, codAluno);
          	stm.setInt(2, codDisciplina);
          	stm.setDate(3, dataMatricula);
          	stm.execute();
          	this.conexao.commit();
          	this.conexao.close();
          }catch(SQLException e) {
          	this.conexao.rollback();
          	throw e;
          }
    }

    public void excluirMatricula(int codMatricula) throws ClassNotFoundException, SQLException {
    	 query = "delete from Matricula where codMatricula = ?";
    	 try {
           	conexao = new Conexao();
           	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
           	stm.setInt(1, codMatricula);
           	stm.execute();
           	this.conexao.commit();
           	this.conexao.close();
           }catch(SQLException e) {
           	this.conexao.rollback();
           	throw e;
           }
    }

    public List<Matricula> consultarMatriculas() throws ClassNotFoundException, SQLException {
    	query="select * from Matricula";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet resultset = stm.executeQuery();
    		List<Matricula> matriculas = new ArrayList<>();
    		while(resultset.next()) {
    			Matricula m = new Matricula(
    					resultset.getInt("codMatricula"),
    					resultset.getInt("codAluno"),
    					resultset.getInt("codDisciplina"),
    					resultset.getDate("dataMatricula")
    					);
    			matriculas.add(m);
    		}
    		return matriculas;
    	}catch (SQLException e) {
    		throw e;
    	}
    }

}