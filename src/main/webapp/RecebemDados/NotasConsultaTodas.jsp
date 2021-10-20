<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.Notas"%>
<%@page import="Model.Aluno"%>
<%@page import="Model.Disciplina"%>

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
        Notas nota = new Notas();
        Aluno a = new Aluno();
        Disciplina d = new Disciplina();
            List<Notas> listaNotas = nota.consultarNotas();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	<th> Codigo </th>
            	<th> Aluno </th>
                <th> Disciplina </th>
                <th> Nota</th>
                <th> Alterar </th>
                <th> Excluir </th>
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Notas n: listaNotas) { %>
                <tr>
              		<td><% out.write(Integer.toString(n.getCodNota())); %></td>
              		<td><% out.write(a.getNomeById((n.getCodAluno()))); %></td>
              		<td><% out.write(d.getDescById((n.getCodDisciplina()))); %></td>
                	<td><% out.write("" + n.getVlrNota()); %></td>
                    <td> <a href ="../Telas/NotasAlterar.jsp?id=<%=n.getCodNota()%>"  ><i class="far fa-edit"     ;style="color:blue"></i> </a></td>
                    <td> <a href ="NotasExclui.jsp?id=<%=n.getCodNota()%>"><i class="far fa-trash-alt"></i> </a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>