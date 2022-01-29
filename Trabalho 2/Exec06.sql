/* ######################################################### */
/* Trabaho 2 - Exercicio 6 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Listar dados solicitados a partir do VIEW Atendimento com id correspondente na tabela Desfechos*/
SELECT A.id_paciente, A.id_atendimento, A.interna, A.alta, A.totexam,
       A.id_hospital, D.de_desfecho, D.dt_desfecho, D.de_tipo_atendimento
    FROM Atendimento A
    JOIN Desfechos D ON A.id_atendimento = D.id_atendimento