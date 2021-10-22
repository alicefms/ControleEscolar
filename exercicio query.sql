/* exercicio 1
Desenvolver uma consulta que mostre as disciplinas que o aluno está matriculado conforme a definicao abaixo:

ALUNO            DISCIPLINA       CARGA HORARIA  PROFESSOR         DATA MATRICULA  
---------------  ---------------        ----     ---------------   --------------
XXXXXXXXXXXXXXX  XXXXXXXXXXXXXXX        9999     XXXXXXXXXXXXXXX     99/99/9999 */

select  a.nomeAluno, d.descDisciplina, d.cargaHoraria, p.nomProfessor, m.dataMatricula from matricula m 
left join aluno a  on a.codAluno = m.codAluno
join disciplina d on d.codDisciplina = m.codDisciplina
join professor p on p.codProfessor = d.codProfessor 
where a.codAluno =2;

/*
 2. Desenvolver uma consulta que mostre a relação de disciplinas com a respectiva carga horária e a soma das cargas horárias
   de todas as disciplinas conforme a definicao abaixo:

DISCIPLINA       CARGA HORARIA   
---------------  ---------------  
XXXXXXXXXXXXXXX      9999
XXXXXXXXXXXXXXX      9999
XXXXXXXXXXXXXXX      9999
XXXXXXXXXXXXXXX      9999 

TOTAL HORAS...:  9999
 
 */
 select descDisciplina , cargaHoraria from disciplina d;
 

/*
3. Desenvolver uma consulta que mostre as notas do aluno e o somatório das notas, por disciplina conforme a definicao abaixo:

ALUNO XXXXXXXXXXXXXXXXXXXXXXXX

DISCIPLINA       NOTAS   
---------------  ----- 
XXXXXXXXXXXXXXX  99,99
XXXXXXXXXXXXXXX  99,99
XXXXXXXXXXXXXXX  99,99

TOTAL NOTAS....: 99,99
*/


select d.descDisciplina, n.vlrNota from notas n 
inner join disciplina d on d.codDisciplina = n.codDisciplina
right join aluno a on a.codAluno = n.codAluno 
where a.codAluno =2;

/*
4. Montar um boletim conforme o layout abaixo:
   Filtar por ALUNO e calcular a MEDIA abastecendo o campo de STATUS conforme critério abaixo:
    
   Se média < 7.5 
     então "REPROVADO" 
       senão "APROVADO"
   Exibir a linha do ALUNO em NEGRITO
   Se REPROVADO, mostrar o STATUS e MEDIA em VERMELHO senão mostrar STATUS em AZUL

-------------------------------------------------------------------------------------------------------
ESCOLA CAPGEMINI MULHER                 - CURSO DE FORMAÇÃO DE DEVS -            DATA ATUAL: 99/99/9999
                                                ** BOLETIM **
-------------------------------------------------------------------------------------------------------

ALUNO: XXXXXXXXXXXXXXXXXXXXXXXXXXX   DATA NASCIMENTO: 99/99/9999

DISCIPLINA         PROFESSOR           NOTAS    
----------------   ------------------- -----
XXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXX 99,99
XXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXX 99,99
XXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXX 99,99
XXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXX 99,99
XXXXXXXXXXXXXXXX   XXXXXXXXXXXXXXXXXXX 99,99

                               MEDIA.: 99,99   STATUS = XXXXXXXXXXX
*/
select d.descDisciplina, p.nomProfessor , n.vlrNota from notas n 
inner join disciplina d on d.codDisciplina = n.codDisciplina
inner join professor p on d.codProfessor = p.codProfessor 
right join aluno a on a.codAluno = n.codAluno 
where a.codAluno =2;
