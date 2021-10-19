<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Professor"%>

<%
    String nomeProf = request.getParameter("nomeProfessor");
	boolean ativo = Boolean.valueOf(request.getParameter("ativo"));

	Professor p = new Professor();
	p.incluirProfessor(nomeProf, ativo);
    
    out.write("Professor adicionado");
   
%>
