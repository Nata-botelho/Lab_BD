-- Igor Guilherme e Natã Botelho 
--- 2 . a

-- inserindo o campo novo com o pwd e hash (usei pwd pq password é palavra reservada)
DROP FUNCTION password_hash(string TEXT);
-- insere uma nova coluna pwd
ALTER TABLE pacientes ADD column pwd TEXT;

--função de hash que fizemos no trabalho 3
CREATE OR replace FUNCTION password_hash(string TEXT) RETURNS TEXT 
	AS $$ DECLARE retornar TEXT;
		BEGIN
			retornar := crypt(string, gen_salt('md5'));
			raise notice 'Password - %, Hash: %', string, retornar;
			RETURN retornar;
		END;  
	$$ LANGUAGE plpgsql;

-- atualizar coluna pwd 
UPDATE pacientes SET pwd = password_hash(concat(id_paciente,cd_municipio)); 

-- FUNCTION usando o trigger 
CREATE OR replace FUNCTION login_paciente() 
	RETURNS trigger AS $LOGIN$ 
		BEGIN  -- id paciente e cd_municipio 
			new.pwd := password_hash(concat(new.id_paciente, new.cd_municipio))
			RETURN new;
		END;
	$LOGIN$ LANGUAGE plpgsql;

-- criamos um trigger que inseir o pwd depois q ja insidos os dados
CREATE trigger LOGIN BEFORE INSERT OR UPDATE ON pacientes
	FOR EACH ROW EXECUTE PROCEDURE login_paciente();

INSERT INTO pacientes (id_paciente,cd_municipio) VALUES ('ID-11188', 'bahia');
INSERT INTO pacientes (id_paciente,cd_municipio) VALUES ('ID-11189', 'bahia');



SELECT * FROM pacientes;

DELETE FROM pacientes WHERE cd_municipio LIKE 'bahia';