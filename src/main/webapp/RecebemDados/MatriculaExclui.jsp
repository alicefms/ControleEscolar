<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Matricula"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Matricula m = new Matricula();
	m.excluirMatricula(id);
    response.sendRedirect("MatriculaConsultaTodas.jsp?mensagem=Matricula excluida com sucesso");
   
%>
