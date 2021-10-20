<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Professor"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Professor p = new Professor();
	boolean b = Boolean.valueOf(request.getParameter("ativo"));
	p.alterarStatusProfessor(id, b);
    response.sendRedirect("ProfessorConsultaTodos.jsp?mensagem=Status Alterado com sucesso");
   
%>
