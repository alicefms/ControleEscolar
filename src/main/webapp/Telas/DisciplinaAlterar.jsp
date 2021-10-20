<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Professor"%>
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
            <form id="matchtech" action="../RecebemDados/DisciplinaAltera.jsp" method="POST">
                <h3>Alteração de Disciplina</h3>
                <p></p>
                <fieldset> 
                    <label>Professor</label>
                    <div class="nomecolaborador"> <select name="codProfessor">
                    <%
                    Professor prof = new Professor();
                    List<Professor> listaProfessores = prof.consultarProfessores();
                    for (Professor p : listaProfessores){
                    %>
                    <option value="<%out.write(""+ p.getCodProfessor()); %>"><%out.write(p.getNomeProfessor()); %></option>
                    <%} %>
                    
                    </select>
                      
                    </div>
                </fieldset>
               <% Disciplina d = new Disciplina(); %>
                
                <fieldset> 
                    <label>Descricao da Disciplina</label>
                    <div class="nomecolaborador">
                        <input id="descricao" name="descricao"  type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Carga Horaria</label>
                    <div class="nomecolaborador">
                        <input id="cargaH" name="cargaH" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                <br>
                 <fieldset> 
                   <div class="nomecolaborador">
                 	<label>Ativa</label>
                 	<select name="ativo">
                 	<option value= true>Ativa</option>
                 	<option value= false>Inativa</option>
                 	</select>
                 </div>	
                </fieldset>
                <input type="text" value="<%=request.getParameter("id")%>" name="id" hidden>
                <div>
                    <div class="form-group col-md-2 h-8">
                        <input type="submit" value="Alterar" class="btn btn-success "/>
                    </div>
                    <div class="form-group col-md-2 h-8">                                 
                        <input type="reset"  value="Cancelar" class="btn btn-danger"/>                        
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>