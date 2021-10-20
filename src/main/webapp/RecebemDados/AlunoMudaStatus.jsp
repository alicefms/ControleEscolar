<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Aluno"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Aluno a = new Aluno();
	boolean b = Boolean.valueOf(request.getParameter("matriculado"));
	a.alterarStatusAluno(id, b);
    response.sendRedirect("AlunoConsultaTodos.jsp?mensagem=Status Alterado com sucesso");
   
%>
