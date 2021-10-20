<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Notas"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	Notas n = new Notas();
	n.excluirNota(id);
    response.sendRedirect("NotasConsultaTodas.jsp?mensagem=Nota excluida com sucesso");
   
%>
