<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>

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
        Aluno disc = new Aluno();
            List<Aluno> listaAlunos = disc.consultarAlunos();
        %>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	<th> Codigo </th>
            	<th> Nome </th>
                <th> CPF </th>
                <th> Data de Nascimento </th>
                <th> Data de Matricula </th>
                <th> Pai </th>
                <th> Mae </th>
                <th> Responsavel </th>
                <th> Telefone do Responsavel </th>
                <th> Alterar </th>
                <th> Excluir </th>
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Aluno a: listaAlunos) { %>
                <tr>
              		<td><% out.write(Integer.toString(a.getCodAluno())); %></td>
                	 <td><% out.write(a.getNomeAluno()); %></td>
                	 <td><% out.write(a.getCpfAluno()); %></td>
                	 <td><% out.write("" + a.getDataNascimento()); %></td>
                	 <td><% out.write("" + a.getDataMatricula()); %></td>
                	 <td><% out.write(a.getNomePai()); %></td>
                	 <td><% out.write(a.getNomeMae()); %></td>
                	 <td><% out.write(a.getResponsavel()); %></td>
                	 <td><% out.write(a.getFoneResponsavel()); %></td>
                    <td><% out.write(Boolean.toString(a.isMatriculado())); %></td>
                    <td> <i class="far fa-edit"     ;style="color:blue"></i></td>
                   <td>  <i class="far fa-trash-alt"></i>  </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>