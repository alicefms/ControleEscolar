<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Notas"%>
<%@page import="java.sql.Date"%>


<%
	int id = Integer.parseInt(request.getParameter("id"));
	float nota = Float.parseFloat(request.getParameter("nota"));
	
	Notas n = new Notas();
	n.alterarNota(id, nota);
    out.write("Nota Alterada com sucesso");
   
%>
