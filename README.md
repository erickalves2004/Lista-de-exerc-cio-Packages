# Sistema de Gestão Acadêmica

## Descrição
Este repositório contém pacotes em PL/SQL desenvolvidos para gerenciar as entidades Aluno, Disciplina e Professor em um banco Oracle.

## Pacotes
### PKG_ALUNO
- Exclusão de aluno e suas matrículas.
- Listagem de alunos maiores de 18 anos.
- Listagem de alunos por curso.

### PKG_DISCIPLINA
- Cadastro de nova disciplina.
- Listagem de disciplinas com mais de 10 alunos.
- Cálculo da média de idade por disciplina.
- Listagem de alunos de uma disciplina.

### PKG_PROFESSOR
- Listagem de professores com mais de uma turma.
- Cálculo de total de turmas de um professor.
- Identificação do professor de uma disciplina.

## Como Executar
1. Abra o SQL*Plus ou outra ferramenta de administração Oracle.
2. Execute o arquivo `script.sql` para criar os pacotes.
3. Utilize as procedures e funções conforme necessário.
