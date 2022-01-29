/* ######################################################### */
/* Exercicio 5 - Natã Silva Botelho - 11275105               */
/* ######################################################### */

/*Exclui a tabela caso ela já exista*/
DROP TABLE IF EXISTS exames_uti CASCADE;

/*Cria a tabela Exames_UTI*/
CREATE TABLE exames_uti
	AS (SELECT *
	   	FROM exames			
	   	WHERE de_origem LIKE '%UTI%');	/*Seleciona apenas os exames com origem em UTI*/
		
/*Contagem de exames da nova tabela*/
SELECT 'contagem de exames', COUNT(*)
	FROM exames_uti;