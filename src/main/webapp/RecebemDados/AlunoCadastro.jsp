<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Model.Aluno"%>
<%@page import="java.sql.Date"%>


<%
		
	String nomeAluno = request.getParameter("nomeAluno");
	String cpf = request.getParameter("cpf");
	Date dataNasc = Date.valueOf(request.getParameter("dataNasc"));
	Date dataMat = Date.valueOf(request.getParameter("dataMat"));
	String nPai = request.getParameter("nomePai");
	String nMae = request.getParameter("nomeMae");
	String Resp = request.getParameter("responsavel");
	String telResp = request.getParameter("telResponsavel");
	boolean matriculado = Boolean.valueOf(request.getParameter("matriculado"));

	Aluno a = new Aluno();
	a.incluirAluno(nomeAluno, cpf, dataNasc, dataMat, nPai, nMae, Resp, telResp, matriculado);
    
    out.write("Aluno adicionado");
   
%>
