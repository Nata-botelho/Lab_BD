/* ######################################################### */
/* Exercicio 3 - Natã Silva Botelho - 11275105               */
/* ######################################################### */

/*Recupera todos os tipos distintos de atendimento*/
SELECT DISTINCT de_tipo_atendimento
    FROM desfechos;

/*Recupera todos os tipos distintos de desfechos*/
SELECT DISTINCT de_desfecho
	FROM desfechos;

/*Recupera todos os desfechos que possuam "óbito" em seus registros*/
SELECT *
	FROM desfechos
	WHERE de_desfecho LIKE '%Óbito%';
	
/*Recupera todos os desfechos que possuam "Alta médica curado" em seus registros*/
SELECT *
	FROM desfechos
	WHERE de_desfecho LIKE '%Alta médica curado%';