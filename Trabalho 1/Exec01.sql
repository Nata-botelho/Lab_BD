/* ######################################################### */
/* Exercicio 1 - Natã Silva Botelho - 11275105               */
/* ######################################################### */

/*Contagem de homens e mulheres*/
SELECT 'Homens', COUNT(*) 
    FROM pacientes
    WHERE ic_sexo='M'
	UNION ALL
SELECT 'Mulheres', COUNT(*)
    FROM pacientes
    WHERE ic_sexo='F'
	UNION ALL

/*Recupera menor e maior ano de nascimento, respectivamente*/
SELECT 'Menor ano de nascimento', MIN(aa_nascimento)
	FROM pacientes
	UNION ALL
SELECT 'Maior ano de nascimento', MAX(aa_nascimento)
	FROM pacientes
	UNION ALL

/*Contagem de anos distintos*/
SELECT 'Quantidade de anos de nascimento distintos', COUNT(DISTINCT aa_nascimento)
	FROM pacientes;