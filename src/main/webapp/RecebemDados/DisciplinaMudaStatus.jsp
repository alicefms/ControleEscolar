<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Disciplina"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Disciplina d = new Disciplina();
	boolean b = Boolean.valueOf(request.getParameter("ativa"));
	d.alterarStatusDisciplina(id, b);
    response.sendRedirect("DisciplinaConsultaTodas.jsp?mensagem=Status Alterado com sucesso");
   
%>
