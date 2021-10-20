<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Matricula"%>
<%@page import="Model.Aluno"%>
<%@page import="java.sql.Date"%>


<%
	int cAluno = Integer.parseInt(request.getParameter("codAluno"));
	int cDisc = Integer.parseInt(request.getParameter("codDisciplina"));
	Date dataMat = Date.valueOf(request.getParameter("dataMat"));
	
	Matricula m = new Matricula();
	m.gerarMatricula(cAluno, cDisc, dataMat);
	
	//muda status do aluno para matriculado=true
			
	Aluno a = new Aluno();
	a.alterarStatusAluno(cAluno, false);
	
	response.sendRedirect("MatriculaConsultaTodas.jsp?mensagem=Matricula gerada com sucesso");
   
%>
