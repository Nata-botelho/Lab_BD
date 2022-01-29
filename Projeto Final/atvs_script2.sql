---2 .b 
 
--table criada 
DROP TABLE IF EXISTS LogAcesso;
CREATE TABLE LogAcesso(
	date_create TIMESTAMP,
	type_operation TEXT,
	table_request TEXT
);

-- crio uma function para inserir logs
CREATE OR replace FUNCTION function_log()
	RETURN trigger AS $trigger_log$
		BEGIN 
			INSERT INTO LogAcesso(date_create,type_operation,table_request)
				VALUES (current_timestamp,TG_OP, TG_TABLE_NAME);
			RETURN new;
		END;
	$trigger_log$ LANGUAGE plpgsql;
	
--- agora criamos trigger para cara tabla 
CREATE trigger triggerLogPacientes AFTER
	INSERT OR DELETE OR UPDATE OR pacientes 
		for each ROW EXECUTE FUNCTION function_log();
		
CREATE trigger triggerLogDefechos AFTER
	INSERT OR DELETE OR UPDATE OR desfechos
		for each ROW EXECUTE FUNCTION function_log();

CREATE trigger triggerLogExames AFTER
	INSERT OR DELETE OR UPDATE OR exames
		for each ROW EXECUTE FUNCTION function_log();

INSERT INTO pacientes (id_paciente) VALUES ('ID-11188');
INSERT INTO desfechos (id_paciente, id_atendimento) VALUES ('ID-11188', 'id_atendimeento');
INSERT INTO exames (id_exame) VALUES (0751127);

UPDATE pacientes SET id_paciente = 'ID-111' WHERE id_paciente = 'ID-11188';
UPDATE exames SET id_exame = 07511272 WHERE id_exame = 0751127;

DELETE FROM desfechos WHERE id_paciente  = 'ID-111';
DELETE FROM pacientes WHERE id_paciente = 'ID-111';
SELECT * FROM logacesso;