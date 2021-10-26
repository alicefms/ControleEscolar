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
        ResultSet res = a.BoletimAluno(Integer.parseInt(request.getParameter("id")));
        int soma = 0;
        int qteNotas = 0;

        
        if ( (res.next() == false) || (res.getString("descDisciplina")== null)){
        	out.write("Este aluno ainda nao tem notas cadastradas");
        	
            
        } else{
        	Date data = new Date(new java.util.Date().getTime());
        	out.write("------------------------------------------------------------------------------------------"+ "<br>" );
        	out.write("ESCOLA CAPGEMINI MULHER  -CURSO DE FORMAÇÃO DE DEVS- DATA ATUAL: " + data + "<br>");
        	out.write("------------------------------------------------------------------------------------------"+ "<br>");
        	out.write("ALUNO: "+ a.getNomeById(Integer.parseInt(request.getParameter("id"))) );
        %>
        
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	
            	<th> Disciplina </th>
                <th> Professor </th>
                <th> Nota </th>
                
        
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% while(res.next()){ %>
                <tr>
              		
                	 <td><% out.print(res.getString("descDisciplina")); %></td>
                	 <td><% out.print(res.getString("nomProfessor")); %></td>
                	 <td><% out.print(String.valueOf(res.getInt("vlrNota"))); %></td>
                	 <% soma = soma + res.getInt("vlrNota"); %>
                	 <% if(res.isLast()){qteNotas= res.getRow();} %>
                </tr>
                <%}%>
            </tbody>
        </table>
        
        
         <%
        float media = (float) soma/qteNotas;
        out.write("MEDIA : " + media + "   " + "<br>" );
        if (media<7.5){
        %>
      
         <label class="mensagem"  style="color: red"> 
          STATUS : REPROVADO      
                
       <%
        }else{ %>
        <label class="mensagem"  style="color: blue"> 
         STATUS : APROVADO
        <% }}%>
        </label>
    </body>
</html>