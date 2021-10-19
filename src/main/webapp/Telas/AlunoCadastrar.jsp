<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Aluno"%>

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
            <form id="matchtech" action="../RecebemDados/AlunoCadastro.jsp" method="POST">
                <h3>Cadastro de Aluno</h3>
                <p></p>
                           
                <fieldset> 
                    <label>Aluno</label>
                    <div class="nomecolaborador">
                        <input id="nomeAluno" name="nomeAluno" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>CPF</label>
                    <div class="nomecolaborador">
                        <input id="cpf" name="cpf" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                
                <fieldset> 
                    <label>Data de Nascimento</label>
                    <div class="nomecolaborador">
                        <input id="dataNasc" name="dataNasc" type="date" >
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Data de Matricula</label>
                    <div class="nomecolaborador">
                        <input id="dataMat" name="dataMat" type="date" >
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Nome do Pai</label>
                    <div class="nomecolaborador">
                        <input id="nomePai" name="nomePai" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Nome da Mae</label>
                    <div class="nomecolaborador">
                        <input id="nomeMae" name="nomeMae" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                <fieldset> 
                    <label>Responsavel</label>
                    <div class="nomecolaborador">
                        <input id="responsavel" name="responsavel" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                
                  <fieldset> 
                    <label>Telefone do Responsavel</label>
                    <div class="nomecolaborador">
                        <input id="telResponsavel" name="telResponsavel" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                <br>
                 <fieldset> 
                   <div class="nomecolaborador">
                 	<label>Status de matricula</label>
                 	<select name="matriculado">
                 	<option value= true>Matriculado</option>
                 	<option value= false>Aluno não matriculado</option>
                 	</select>
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