/* ######################################################### */
/* Trabaho 2 - Exercicio 5 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Recuperação dos dados solicitados com os devidos tratamentos e organização*/
SELECT id_paciente, min(interna) "Internação", max(alta) "Alta", sum(totexam)"N exames" FROM atendimento
GROUP BY id_paciente