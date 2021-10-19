<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.Matricula"%>

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
        Matricula mat = new Matricula();
            List<Matricula> listaMatriculas = mat.consultarMatriculas();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	<th> Codigo </th>
            	<th> Aluno </th>
                <th> Disciplina </th>
                <th> Data de Matricula </th>
                <th> Alterar </th>
                <th> Excluir </th>
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Matricula m: listaMatriculas) { %>
                <tr>
              		<td><% out.write(Integer.toString(m.getCodMatricula())); %></td>
              		<td><% out.write(Integer.toString(m.getCodAluno())); %></td>
              		<td><% out.write(Integer.toString(m.getCodDisciplina())); %></td>
                	<td><% out.write("" + m.getDataMatricula()); %></td>
                    <td> <i class="far fa-edit"     ;style="color:blue"></i></td>
                   <td>  <i class="far fa-trash-alt"></i>  </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>