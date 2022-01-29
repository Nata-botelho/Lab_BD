/* ######################################################### */
/* Trabaho 2 - Exercicio 4 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Criar tabela ExHemograma com dados dos exames de hemograma, ordenados pela data de coleta e id dos hospitais*/
DROP TABLE IF EXISTS ExHemograma;
CREATE TABLE ExHemograma
	AS (SELECT id_paciente, id_atendimento, dt_coleta, de_analito, de_resultado, de_valor_referencia,
	  	ROW_NUMBER() OVER(PARTITION BY id_paciente ORDER BY dt_coleta, id_hospital) "Sequencia"
	  	FROM EXAMES
	 	WHERE UPPER(de_exame) LIKE '%HEMOGRAMA%');