CREATE OR REPLACE PACKAGE PKG_DISCIPLINA AS 
  PROCEDURE cadastrar_disciplina(p_nome VARCHAR2, p_descricao VARCHAR2, p_carga_horaria NUMBER);
  CURSOR total_alunos;
  CURSOR media_idade_por_disciplina(p_id_disciplina NUMBER);
  PROCEDURE listar_alunos_disciplina(p_id_disciplina NUMBER);
END PKG_DISCIPLINA;
/

CREATE OR REPLACE PACKAGE BODY PKG_DISCIPLINA AS 
  PROCEDURE cadastrar_disciplina(p_nome VARCHAR2, p_descricao VARCHAR2, p_carga_horaria NUMBER) IS
  BEGIN
    INSERT INTO DISCIPLINA (nome, descricao, carga_horaria)
    VALUES (p_nome, p_descricao, p_carga_horaria);
  END cadastrar_disciplina;

  CURSOR total_alunos IS
    SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total
    FROM DISCIPLINA d
    JOIN MATRICULA m ON d.id_disciplina = m.id_disciplina
    GROUP BY d.nome
    HAVING COUNT(m.id_aluno) > 10;

  CURSOR media_idade_por_disciplina(p_id_disciplina NUMBER) IS
    SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, a.data_nascimento) / 12)) AS media_idade
    FROM ALUNO a
    JOIN MATRICULA m ON a.id_aluno = m.id_aluno
    WHERE m.id_disciplina = p_id_disciplina;

  PROCEDURE listar_alunos_disciplina(p_id_disciplina NUMBER) IS
    CURSOR alunos_disciplina IS
      SELECT a.nome
      FROM ALUNO a
      JOIN MATRICULA m ON a.id_aluno = m.id_aluno
      WHERE m.id_disciplina = p_id_disciplina;
  BEGIN
    FOR aluno IN alunos_disciplina LOOP
      DBMS_OUTPUT.PUT_LINE('Aluno: ' || aluno.nome);
    END LOOP;
  END listar_alunos_disciplina;
END PKG_DISCIPLINA;
/
