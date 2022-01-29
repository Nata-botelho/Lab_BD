/* ######################################################### */
/* Trabaho 2 - Exercicio 2 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Listar os exames, gênero e contagem de clínicas distintas dos dados que 
possuem contador maior que 10 e menor que 20*/
SELECT E.de_exame, P.ic_sexo, COUNT(DISTINCT E.de_origem) "Clinicas distintas"
    FROM Exames E JOIN Pacientes P ON E.id_paciente = P.id_paciente
	GROUP BY CUBE(E.de_exame, P.ic_sexo) --Agrupamento com CUBE
	HAVING COUNT(DISTINCT E.de_origem) > 10 AND COUNT(DISTINCT E.de_origem) < 20 --Delimitador de dados
	ORDER BY COUNT(DISTINCT E.de_origem) DESC
	