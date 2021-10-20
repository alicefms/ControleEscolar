<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Professor"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Professor p = new Professor();
	String novoNome = request.getParameter("nomeProfessor");
	p.alterarNomeProfessor(id, novoNome);
	response.sendRedirect("ProfessorConsultaTodos.jsp?mensagem=Nome de Professor alterado com sucesso");
   
%>
