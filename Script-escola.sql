create database escola;
use escola;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Disciplina`;
DROP TABLE IF EXISTS `Professor`;
DROP TABLE IF EXISTS `Matricula`;
DROP TABLE IF EXISTS `Aluno`;
DROP TABLE IF EXISTS `Notas`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `Disciplina` (
    `codDisciplina` int auto_increment NOT NULL,
    `codProfessor` int NOT NULL,
    `descDisciplina` Varchar(30),
    `cargaHoraria` int,
    `ativa` boolean NOT NULL,
    PRIMARY KEY (`codDisciplina`, `codProfessor`)
);

CREATE TABLE `Professor` (
    `codProfessor` int auto_increment NOT NULL,
    `nomProfessor` Varchar(40),
    `ativo` boolean,
    PRIMARY KEY (`codProfessor`)
);

CREATE TABLE `Matricula` (
    `codMatricula`int auto_increment NOT NULL,
    `codAluno` int NOT NULL,
    `codDisciplina` int NOT NULL,
    `dataMatricula` Date,
    PRIMARY KEY (`codMatricula`, `codAluno`, `codDisciplina`)
);

CREATE TABLE `Aluno` (
    `codAluno` int auto_increment NOT NULL,
    `nomeAluno` Varchar(40),
    `cpfAluno` Varchar(14),
    `dataNascimento` Date,
    `dataMatricula` Date NOT NULL,
    `nomePai` Varchar(40) NOT NULL,
    `nomeMae` Varchar(40) NOT NULL,
    `responsavel` Varchar(40),
    `foneResponsavel` Varchar(11) NOT NULL,
    `matriculado` boolean,
    PRIMARY KEY (`codAluno`)
);

CREATE TABLE `Notas` (
    `codNota` int auto_increment NOT NULL,
    `codAluno` int NOT NULL,
    `codDisciplina` int NOT NULL,
    `vlrNota` decimal(4,2),
    PRIMARY KEY (`codNota`, `codAluno`, `codDisciplina`)
);

ALTER TABLE `Disciplina` ADD FOREIGN KEY (`codProfessor`) REFERENCES `Professor`(`codProfessor`);
ALTER TABLE `Matricula` ADD FOREIGN KEY (`codDisciplina`) REFERENCES `Disciplina`(`codDisciplina`);
ALTER TABLE `Notas` ADD FOREIGN KEY (`codAluno`) REFERENCES `Aluno`(`codAluno`);
ALTER TABLE `Notas` ADD FOREIGN KEY (`codDisciplina`) REFERENCES `Disciplina`(`codDisciplina`);