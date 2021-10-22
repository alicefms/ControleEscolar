package Model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Infra.Conexao;

public class Aluno {

    public Aluno(int codAluno, String nomeAluno, String cpfAluno, Date dataNascimento, Date dataMatricula,
			String nomePai, String nomeMae, String responsavel, String foneResponsavel, boolean matriculado) {
		super();
		this.codAluno = codAluno;
		this.nomeAluno = nomeAluno;
		this.cpfAluno = cpfAluno;
		this.dataNascimento = dataNascimento;
		this.dataMatricula = dataMatricula;
		this.nomePai = nomePai;
		this.nomeMae = nomeMae;
		this.responsavel = responsavel;
		this.foneResponsavel = foneResponsavel;
		this.matriculado = matriculado;
	}

	public Aluno(String nomeAluno, String cpfAluno, Date dataNascimento, Date dataMatricula, String nomePai,
			String nomeMae, String responsavel, String foneResponsavel, boolean matriculado) {
		super();
		this.nomeAluno = nomeAluno;
		this.cpfAluno = cpfAluno;
		this.dataNascimento = dataNascimento;
		this.dataMatricula = dataMatricula;
		this.nomePai = nomePai;
		this.nomeMae = nomeMae;
		this.responsavel = responsavel;
		this.foneResponsavel = foneResponsavel;
		this.matriculado = matriculado;
	}

	public int getCodAluno() {
		return codAluno;
	}

	public void setCodAluno(int codAluno) {
		this.codAluno = codAluno;
	}

	public String getNomeAluno() {
		return nomeAluno;
	}

	public void setNomeAluno(String nomeAluno) {
		this.nomeAluno = nomeAluno;
	}

	public String getCpfAluno() {
		return cpfAluno;
	}

	public void setCpfAluno(String cpfAluno) {
		this.cpfAluno = cpfAluno;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Date getDataMatricula() {
		return dataMatricula;
	}

	public void setDataMatricula(Date dataMatricula) {
		this.dataMatricula = dataMatricula;
	}

	public String getNomePai() {
		return nomePai;
	}

	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}

	public String getNomeMae() {
		return nomeMae;
	}

	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getFoneResponsavel() {
		return foneResponsavel;
	}

	public void setFoneResponsavel(String foneResponsavel) {
		this.foneResponsavel = foneResponsavel;
	}

	public boolean isMatriculado() {
		return matriculado;
	}

	public void setMatriculado(boolean matriculado) {
		this.matriculado = matriculado;
	}

	public Aluno() {
    }

    public int codAluno;

    public String nomeAluno;

    public String cpfAluno;

    public Date dataNascimento;

    public Date dataMatricula;

    public String nomePai;

    public String nomeMae;

    public String responsavel;

    public String foneResponsavel;

    public boolean matriculado = true;

    private Conexao conexao;
    String query = "";
    
    public void incluirAluno(String nomeAluno, String cpfAluno, Date dataNascimento, Date dataMatricula, String nomePai,
			String nomeMae, String responsavel, String foneResponsavel, boolean matriculado) throws ClassNotFoundException, SQLException {
    	  query ="insert into Aluno(nomeAluno, cpfAluno, dataNascimento, dataMatricula, nomePai, nomeMae, responsavel, foneResponsavel, matriculado) values (?,?,?,?,?,?,?,?,?)";
          
  		try {
  			conexao = new Conexao();
  	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
          	stm.setString(1, nomeAluno);
          	stm.setString(2, cpfAluno);
          	stm.setDate(3, dataNascimento);
          	stm.setDate(4, dataMatricula);
          	stm.setString(5, nomePai);
          	stm.setString(6, nomeMae);
          	stm.setString(7, responsavel);
          	stm.setString(8, foneResponsavel);
          	stm.setBoolean(9, matriculado);
          	stm.execute();
          	this.conexao.commit();
          	this.conexao.close();
          }catch(SQLException e){
          	System.out.print(e);
          	this.conexao.rollback();
          	throw e;
          }
    }

    public void alterarAluno(String responsavel, String foneResponsavel, int codAluno) throws SQLException, ClassNotFoundException {
    	query= "update Aluno set responsavel =? , foneResponsavel=?  where codAluno = ?";
    	
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
        	stm.setString(1, responsavel);
        	stm.setString(2, foneResponsavel);
        	stm.setInt(3, codAluno);
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }

    public List<Aluno> consultarAlunos() throws SQLException, ClassNotFoundException {
    	query="select * from aluno";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		ResultSet resultset = stm.executeQuery();
    		List<Aluno> alunos = new ArrayList<>();
    		while(resultset.next()) {
    			Aluno a = new Aluno(
    					resultset.getInt("codAluno"),
    					resultset.getString("nomeAluno"),
    					resultset.getString("cpfAluno"),
    					resultset.getDate("dataNascimento"),
    					resultset.getDate("dataMatricula"),
    					resultset.getString("nomePai"),
    					resultset.getString("nomeMae"),
    					resultset.getString("responsavel"),
    					resultset.getString("foneResponsavel"),
    					resultset.getBoolean("matriculado")
    					);
    			alunos.add(a);
    		}
    		return alunos;
    	}catch (SQLException e) {
    		throw e;
    	}
    }

    public void alterarStatusAluno( int codAluno, boolean matriculado) throws SQLException, ClassNotFoundException {
    	query= "update aluno set matriculado =? where codAluno = ?";
    	
    	if (matriculado == true) matriculado = false;
    	else matriculado = true;
    	try {
			conexao = new Conexao();
	       	PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
	       	stm.setBoolean(1, matriculado);
        	stm.setInt(2, codAluno );
        	stm.execute();
        	this.conexao.commit();
        	this.conexao.close();
        }catch(SQLException e){
        	System.out.print(e);
        	this.conexao.rollback();
        	throw e;
        }
    }
    
     
    
    public String getNomeById(int id) throws ClassNotFoundException, SQLException {
    	query="select nomeAluno from Aluno where codAluno = ?";
    	String nomeAl ="";
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		stm.setInt(1, id);
    		ResultSet res = stm.executeQuery();
    		if(res.next()) {
    			nomeAl = res.getString("nomeAluno");
    		}
    		return nomeAl;
    	}catch (SQLException e) {
    		throw e;
    	}
    }
    
    public ResultSet disciplinasAluno (int id) throws ClassNotFoundException, SQLException {
    	query = "select  a.nomeAluno, d.descDisciplina, d.cargaHoraria, p.nomProfessor, m.dataMatricula from matricula m \n"
    			+ "left join aluno a  on a.codAluno = m.codAluno\n"
    			+ "join disciplina d on d.codDisciplina = m.codDisciplina\n"
    			+ "join professor p on p.codProfessor = d.codProfessor \n"
    			+ "where a.codAluno =?";
    	
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		stm.setInt(1, id);
    		ResultSet res = stm.executeQuery();
    		return res;
    	}catch (SQLException e) {
    		throw e;
    	}
    }
    
    public ResultSet NotasAluno (int id) throws ClassNotFoundException, SQLException {
    	query = "select d.descDisciplina, n.vlrNota from notas n \n"
    			+ "inner join disciplina d on d.codDisciplina = n.codDisciplina\n"
    			+ "right join aluno a on a.codAluno = n.codAluno \n"
    			+ "where a.codAluno =?";
    	
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		stm.setInt(1, id);
    		ResultSet res = stm.executeQuery();
    		return res;
    	}catch (SQLException e) {
    		throw e;
    	}
    }
    
    
    public ResultSet BoletimAluno (int id) throws ClassNotFoundException, SQLException {
    	query = "select d.descDisciplina, p.nomProfessor , n.vlrNota from notas n \n"
    			+ "inner join disciplina d on d.codDisciplina = n.codDisciplina\n"
    			+ "inner join professor p on d.codProfessor = p.codProfessor \n"
    			+ "right join aluno a on a.codAluno = n.codAluno \n"
    			+ "where a.codAluno =?";
    	
    	try {
    		conexao = new Conexao();
    		PreparedStatement stm = this.conexao.getConnection().prepareStatement(query);
    		stm.setInt(1, id);
    		ResultSet res = stm.executeQuery();
    		return res;
    	}catch (SQLException e) {
    		throw e;
    	}
    }
}