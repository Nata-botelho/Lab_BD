/* ######################################################### */
/* Trabaho 2 - Exercicio 1 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Listar total de exames, e quantidade de tipos de exames de cada paciente de São Paulo*/
SELECT P.ID_Paciente, Count(*), Count(Distinct DE_Exame)
    FROM Pacientes P JOIN Exames E ON P.ID_Paciente = E.ID_Paciente --Checagem de correspondencia entre chaves
    WHERE CD_Municipio ='SAO PAULO'
    GROUP BY ROLLUP(P.ID_Paciente) --Agrupamento
    ORDER by Count(Distinct DE_Exame) DESC 