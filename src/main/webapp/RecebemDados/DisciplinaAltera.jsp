<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Disciplina"%>

<%
	int codProfessor= Integer.parseInt(request.getParameter("codProfessor"));
    String descDisciplina = request.getParameter("descricao");
	int cargaHoraria = Integer.parseInt(request.getParameter("cargaH"));
	boolean ativa = Boolean.valueOf(request.getParameter("ativo"));
	int id = Integer.parseInt(request.getParameter("id"));
	Disciplina d = new Disciplina();
	d.alterarDisciplina(id, codProfessor,descDisciplina, cargaHoraria, ativa);
    
	 response.sendRedirect("DisciplinaConsultaTodas.jsp?mensagem=Disciplina Alterada com sucesso");
	    
   
%>
