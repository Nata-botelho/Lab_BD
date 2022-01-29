/* ######################################################### */
/* Exercicio 2 - Natã Silva Botelho - 11275105               */
/* ######################################################### */

/*Recupera exames mais recente e antigo, respectivamente*/
SELECT 'Exame mais recente', MAX(dt_coleta)
	FROM exames
	UNION ALL
SELECT 'Exame mais antigo', MIN(dt_coleta)
	FROM exames;

/*Faz a contagem de todos os exames com registro "covid"*/
SELECT 'Contagem de exames de covid', COUNT(*)
	FROM exames
	WHERE LOWER(de_exame) LIKE '%covid%';
	
/*Recupera todos os exames que tenham registro de covid e que possuam o resultado de "Detectado"*/
SELECT *
	FROM exames
	WHERE LOWER(de_exame) LIKE '%covid%'
	AND LOWER(de_resultado) LIKE 'detectado';