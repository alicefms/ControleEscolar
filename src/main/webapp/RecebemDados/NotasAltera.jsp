<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Notas"%>
<%@page import="java.sql.Date"%>


<%
	int cAluno = Integer.parseInt(request.getParameter("codAluno"));
	int cDisc = Integer.parseInt(request.getParameter("codDisciplina"));
	float nota = Float.parseFloat(request.getParameter("nota"));
	
	Notas n = new Notas();
	n.incluirNota(cAluno, cDisc, nota);
    out.write("Nota Inserida com sucesso");
   
%>
