/* ######################################################### */
/* Exercicio 4 - Natã Silva Botelho - 11275105               */
/* ######################################################### */

/*Realiza a troca de tipo do campo id_hospital de cada tabela*/
ALTER TABLE pacientes
ALTER COLUMN id_hospital TYPE TEXT;

ALTER TABLE exames
ALTER COLUMN id_hospital TYPE TEXT;

ALTER TABLE desfechos
ALTER COLUMN id_hospital TYPE TEXT;

/*Realiza a atualização do conteúdo do id_hospital em cada tabela*/
UPDATE pacientes
	SET id_hospital = 'HCFMUSP'
	WHERE id_hospital = '0';
	
UPDATE pacientes
	SET id_hospital = 'HSL'
	WHERE id_hospital = '1';
	
UPDATE exames
	SET id_hospital = 'HCFMUSP'
	WHERE id_hospital = '0';
	
UPDATE exames
	SET id_hospital = 'HSL'
	WHERE id_hospital = '1';
	
UPDATE desfechos
	SET id_hospital = 'HCFMUSP'
	WHERE id_hospital = '0';
	
UPDATE desfechos
	SET id_hospital = 'HSL'
	WHERE id_hospital = '1';