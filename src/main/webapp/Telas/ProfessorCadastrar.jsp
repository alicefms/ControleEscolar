<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <form id="matchtech" action="../RecebemDados/ProfessorCadastro.jsp" method="POST">
                <h3>Cadastro de Professor</h3>
                <p></p>
                <fieldset> 
                    <label>Nome</label>
                    <div class="nomecolaborador">
                        <input id="nomeProfessor" name="nomeProfessor" type="text" maxlength="30" required size=30 style="text-transform: uppercase">
                    </div>
                </fieldset>
                <br>
                 <fieldset> 
                   <div class="nomecolaborador">
                 	<label>Ativo</label>
                 	<select name="ativo">
                 	<option value= true>Ativo</option>
                 	<option value= false>Inativo</option>
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