<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
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
            Professor prof = new Professor();
            List<Professor> listaProfessores = prof.consultarProfessores();
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
                <th> Nome do Professor </th>
                <th> Ativo </th>
                
                
            </thead>
            <!-- corpo da tabela -->
            <tbody>
                <% for (Professor p: listaProfessores) { %>
                <tr>
                	<td><% out.write(Integer.toString(p.getCodProfessor())); %></td>
                    <td><% out.write(p.getNomeProfessor()); %> <a href ="../Telas/ProfessorAlterarNome.jsp?id=<%=p.getCodProfessor()%>"  ><i class="far fa-edit"     ;style="color:blue"></i> </a></td>
                     <td><% out.write(Boolean.toString(p.isAtivo())); %> <a href ="ProfessorMudaStatus.jsp?id=<%=p.getCodProfessor()%>&ativo=<%=p.isAtivo()%>"><i class="far fa-edit"     ;style="color:blue"></i> </a></td>
                   
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
