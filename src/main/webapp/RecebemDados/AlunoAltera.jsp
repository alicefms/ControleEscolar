<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Aluno"%>
<%@page import="java.sql.Date"%>


<%
	String Resp = request.getParameter("responsavel");
	String telResp = request.getParameter("telResponsavel");
	int id = Integer.parseInt(request.getParameter("id"));

	Aluno a = new Aluno();
	a.alterarAluno(Resp, telResp, id);
	response.sendRedirect("AlunoConsultaTodos.jsp?mensagem=Dados do Responsavel do Aluno alterados com sucesso");
    
   
%>
