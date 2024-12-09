CREATE OR REPLACE PACKAGE PKG_PROFESSOR AS 
  CURSOR total_turmas_professor;
  FUNCTION total_turmas(p_id_professor NUMBER) RETURN NUMBER;
  FUNCTION professor_disciplina(p_id_disciplina NUMBER) RETURN VARCHAR2;
END PKG_PROFESSOR;
/

CREATE OR REPLACE PACKAGE BODY PKG_PROFESSOR AS 
  CURSOR total_turmas_professor IS
    SELECT p.nome, COUNT(t.id_turma) AS total
    FROM PROFESSOR p
    JOIN TURMA t ON p.id_professor = t.id_professor
    GROUP BY p.nome
    HAVING COUNT(t.id_turma) > 1;

  FUNCTION total_turmas(p_id_professor NUMBER) RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_total
    FROM TURMA
    WHERE id_professor = p_id_professor;
    RETURN v_total;
  END total_turmas;

  FUNCTION professor_disciplina(p_id_disciplina NUMBER) RETURN VARCHAR2 IS
    v_nome_professor VARCHAR2(100);
  BEGIN
    SELECT p.nome INTO v_nome_professor
    FROM PROFESSOR p
    JOIN TURMA t ON p.id_professor = t.id_professor
    WHERE t.id_disciplina = p_id_disciplina;
    RETURN v_nome_professor;
  END professor_disciplina;
END PKG_PROFESSOR;
/
