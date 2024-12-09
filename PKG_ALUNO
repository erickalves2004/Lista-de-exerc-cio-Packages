CREATE OR REPLACE PACKAGE PKG_ALUNO AS 
  PROCEDURE excluir_aluno(p_id_aluno NUMBER);
  CURSOR listar_maiores_18 RETURN ALUNO%ROWTYPE;
  CURSOR listar_por_curso(p_id_curso NUMBER) RETURN ALUNO%ROWTYPE;
END PKG_ALUNO;
/

CREATE OR REPLACE PACKAGE BODY PKG_ALUNO AS 
  PROCEDURE excluir_aluno(p_id_aluno NUMBER) IS
  BEGIN
    DELETE FROM MATRICULA WHERE id_aluno = p_id_aluno;
    DELETE FROM ALUNO WHERE id_aluno = p_id_aluno;
  END excluir_aluno;

  CURSOR listar_maiores_18 IS
    SELECT nome, data_nascimento
    FROM ALUNO
    WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) > 18;

  CURSOR listar_por_curso(p_id_curso NUMBER) IS
    SELECT nome 
    FROM ALUNO 
    WHERE id_curso = p_id_curso;
END PKG_ALUNO;
/
