<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Disciplina"%>

<%
	int codProfessor= Integer.parseInt(request.getParameter("codProfessor"));
    String descDisciplina = request.getParameter("descricao");
	int cargaHoraria = Integer.parseInt(request.getParameter("cargaH"));
	boolean ativa = Boolean.valueOf(request.getParameter("ativo"));

	Disciplina d = new Disciplina();
	d.incluirDisciplina(codProfessor,descDisciplina, cargaHoraria, ativa);
	 response.sendRedirect("DisciplinaConsultaTodas.jsp?mensagem=Disciplina cadastrada com sucesso");
    
   
%>
