/* ######################################################### */
/* Trabaho 2 - Exercicio 3 - Natã Silva Botelho - 11275105   */
/* ######################################################### */

/*Criar tabela HistExamDesfechos com dados de ambas tabelas e partição sequencial ordenada pela data de coleta,
data de desfecho, descrição dos exames, descrição dos analitos*/
DROP TABLE IF EXISTS HistExamDesfechos;
CREATE TABLE HistExamDesfechos 
	AS	(SELECT E.*, row_number() OVER(PARTITION BY E.id_paciente ORDER BY dt_coleta, dt_desfecho, de_exame, de_analito), 
		D.dt_atendimento, D.de_tipo_atendimento, D.id_clinica, D.de_clinica, D.dt_desfecho, D.de_desfecho
		FROM Exames E JOIN Desfechos D ON E.id_paciente = D.id_paciente);