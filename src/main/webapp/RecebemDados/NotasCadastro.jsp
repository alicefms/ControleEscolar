<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Notas"%>
<%@page import="java.sql.Date"%>


<%
	int cAluno = Integer.parseInt(request.getParameter("codAluno"));
	int cDisc = Integer.parseInt(request.getParameter("codDisciplina"));
	float nota = Float.parseFloat(request.getParameter("nota"));
	
	
	Notas n = new Notas();
	if (n.checkAlunoDisciplina(cAluno, cDisc)){
	n.incluirNota(cAluno, cDisc, nota);
	response.sendRedirect("NotasConsultaTodas.jsp?mensagem=Nota cadastrada com sucesso");}
	else response.sendRedirect("../Telas/NotasCadastrar.jsp?mensagem=O aluno não está matriculado na disciplina");
%>
