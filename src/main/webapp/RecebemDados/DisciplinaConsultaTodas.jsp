<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="Model.Disciplina"%>
<%@page import="Model.Professor"%>

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
            Disciplina disc = new Disciplina();
            List<Disciplina> listaDisciplinas = disc.consultarDisciplinas();
            Professor p = new Professor();
        %>
        
        <label class="mensagem" id="msg" style="color: red">
                    <%
                        if(request.getParameter("mensagem") != null)
                            out.write(request.getParameter("mensagem"));  
                    %>
                </label>
        <table id="consulta">
            <!-- cabecalho da tabela -->
            <thead>
            	<th> Codigo </th>
            	<th> Professor </th>
                <th> Disciplina </th>
                <th> Carga Horaria </th>
                <th> Ativa </th>
                <th> Alterar </th>
                
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Disciplina d: listaDisciplinas) { %>
                <tr>
              		 <td><% out.write(Integer.toString(d.getCodDisciplina())); %></td>
                	<td><% out.write(p.getNomeById(d.getCodProfessor())); %></td>
                    <td><% out.write(d.getDescDisciplina()); %></td>
                    <td><% out.write(Integer.toString(d.getCargaHoraria())); %></td>
                     <td><% out.write(Boolean.toString(d.isAtiva())); %>  <a href ="DisciplinaMudaStatus.jsp?id=<%=d.getCodDisciplina()%>&ativa=<%=d.isAtiva()%>"><i class="fas fa-exchange-alt"></i> </a> </td>
                    <td> <a href ="../Telas/DisciplinaAlterar.jsp?id=<%=d.getCodDisciplina()%>"><i class="far fa-edit"    ></i> </a> </td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>