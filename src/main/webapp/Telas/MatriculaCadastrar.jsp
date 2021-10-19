<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>
<%@page import="Model.Disciplina"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE DE TAREFAS - CAPGEMINI</title>
        <link   rel ="stylesheet" href="../Styles/padraotelacadastro.css">
        <script src ="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    
    <body> 
        <div class="container">
            <form id="matchtech" action="../RecebemDados/MatriculaCadastro.jsp" method="POST">
                <h3>Cadastro de Matricula</h3>
                <p></p>
                <fieldset> 
                    <label>Aluno</label>
                    <div class="nomecolaborador"> <select name="codAluno">
                    <%
                    Aluno al = new Aluno();
                    List<Aluno> listaAlunos =al.consultarAlunos();
                    for (Aluno a : listaAlunos){
                    %>
                    <option value="<%out.write(""+ a.getCodAluno()); %>"><%out.write(a.getNomeAluno()); %></option>
                    <%} %>
                    </select>
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Disciplina</label>
                    <div class="nomecolaborador"> <select name="codDisciplina">
                    <%
                    Disciplina disc = new Disciplina();
                    List<Disciplina> listaDisciplinas =disc.consultarDisciplinas();
                    for (Disciplina d : listaDisciplinas){
                    %>
                    <option value="<%out.write(""+ d.getCodDisciplina()); %>"><%out.write(d.getDescDisciplina()); %></option>
                    <%} %>
                    </select>  
                    </div>
                </fieldset>
               
                <fieldset> 
                    <label>Data de Matricula</label>
                    <div class="nomecolaborador">
                        <input id="dataMat" name="dataMat" type="date" >
                    </div>
                </fieldset>
                
                             
                <div>
                    <div class="form-group col-md-2 h-8">
                        <input type="submit" value="Cadastrar" class="btn btn-success "/>
                    </div>
                    <div class="form-group col-md-2 h-8">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>