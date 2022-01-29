-- Os seguintes scripts carregam os dados na sua base de dados no servidor a partir de 'labbd2021'.

-- Em <user> coloque seu usuario de acesso ->'uNUSP'
-- Em <pwd> coloque sua senha de acesso

SELECT dblink_connect('labbd', 'dbname=labbd2021 user=<user> password=<pwd_user>');  


DROP TABLE IF EXISTS pacientes CASCADE;
CREATE TABLE pacientes As (SELECT * FROM dblink('labbd','SELECT * FROM pacientes') AS (id_paciente TEXT,																					 																				  
ic_sexo               CHAR,
aa_nascimento         INTEGER, 
cd_pais               TEXT,
cd_uf                 CHAR(2),
cd_municipio          TEXT,
cd_cepreduzido        TEXT,
id_hospital           INTEGER /** 0 - HCFMUSP / 1 - HSL **/));


DROP TABLE IF EXISTS exames CASCADE;
CREATE TABLE exames  As (SELECT * FROM dblink('labbd','SELECT * FROM exames') AS (

id_exame 			INTEGER,
id_paciente         TEXT,
id_atendimento      TEXT,
dt_coleta           DATE,
de_origem           TEXT,
de_exame            TEXT,
de_analito          TEXT,
de_resultado        TEXT,
cd_unidade          TEXT,
de_valor_referencia TEXT,
id_hospital         INTEGER 
	
));


DROP TABLE IF EXISTS desfechos CASCADE;
CREATE TABLE desfechos As (SELECT * FROM dblink('labbd','SELECT * FROM desfechos') AS (
id_paciente             TEXT,
id_atendimento          TEXT,
dt_atendimento          DATE,
de_tipo_atendimento     TEXT,
id_clinica              INTEGER,
de_clinica              TEXT,
dt_desfecho             DATE,
de_desfecho             TEXT,
id_hospital             INTEGER

));