<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE DE TAREFAS - CAPGEMINI</title>
        <link rel="stylesheet" href="../Styles/padraotelagrid.css">
        <!-- bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/>        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <!-- Fontawesome' -->
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </head>
    <body>
        <%
        Aluno a = new Aluno();
        ResultSet res = a.NotasAluno(Integer.parseInt(request.getParameter("id")));
        int soma = 0;
        if (!res.next()){
        	out.write("Este aluno ainda não tem notas cadastradas");
        } else{
        %>
        
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	
            	<th> Disciplina </th>
                <th> Nota </th>
                
        
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% while(res.next()){ %>
                <tr>
              		
                	 <td><% out.write(res.getString("descDisciplina")); %></td>
                	 <td><% out.write(String.valueOf(res.getInt("vlrNota"))); %></td>
                	 <% soma = soma + res.getInt("vlrNota"); %>
                	 
                </tr>
                <%}%>
            </tbody>
        </table>
        <% out.write("TOTAL NOTAS : " + soma); }%>
        
    </body>
</html>