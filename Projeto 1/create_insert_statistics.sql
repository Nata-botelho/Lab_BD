--CRIAÇÃO DAS TABELAS

DROP TABLE IF EXISTS Paciente CASCADE;
DROP TABLE IF EXISTS Atendimento CASCADE;
DROP TABLE IF EXISTS Exame CASCADE;
DROP TABLE IF EXISTS Desfecho CASCADE;

CREATE TABLE IF NOT EXISTS Paciente (
    ID_PACIENTE varchar(40) NOT NULL,
    IC_SEXO char(1) NOT NULL,
    AA_NASCIMENTO varchar(4) NOT NULL,
    CD_PAIS varchar(20) NOT NULL,
    CD_UF varchar(2) NOT NULL,
    CD_MUNICIPIO varchar(40) NOT NULL,
    CE_REPRODUZIDO varchar(8),
        CONSTRAINT PK_Paciente PRIMARY KEY (ID_PACIENTE)
);

CREATE TABLE IF NOT EXISTS Exame  (
    ID_EXAME SERIAL NOT NULL,
    ID_PACIENTE varchar(40) NOT NULL,
    ID_ATENDIMENTO varchar(40) NOT NULL,
    DT_COLETA DATE NOT NULL,
    DE_ORIGEM TEXT NOT NULL,
    DE_EXAME TEXT NOT NULL,
    DE_ANALITO TEXT NOT NULL,
    DE_RESULTADO TEXT,
    CD_UNIDADE varchar(40),
    DE_VALOR_REFERENCIA TEXT,
		CONSTRAINT PK_Exame PRIMARY KEY (ID_EXAME, ID_ATENDIMENTO),
        CONSTRAINT FK_PacienteExame FOREIGN KEY (ID_PACIENTE)
            REFERENCES Paciente(ID_PACIENTE)
        
);

CREATE TABLE IF NOT EXISTS Desfecho   (
    ID_DESFECHO SERIAL NOT NULL,
    ID_ATENDIMENTO varchar(40) NOT NULL,
    ID_PACIENTE varchar(40) NOT NULL,
    DT_ATENDIMENTO DATE NOT NULL,
    DE_TIPO_ATENDIMENTO varchar(40) NOT NULL,
    ID_CLINICA int NOT NULL,
    DE_CLINICA varchar(40) NOT NULL,
    DT_DESFECHO varchar(10) NOT NULL,
    DE_DESFECHO TEXT NOT NULL,
		CONSTRAINT PK_Desfecho PRIMARY KEY (ID_DESFECHO, ID_ATENDIMENTO),
        CONSTRAINT FK_PacienteDesfecho FOREIGN KEY (ID_PACIENTE)
            REFERENCES Paciente(ID_PACIENTE)
);

--INSERÇÃO DOS DADOS

COPY Paciente(
	id_paciente,
	ic_sexo,
	aa_nascimento,
	cd_pais,
	cd_uf,
	cd_municipio,
	ce_reproduzido
)
FROM 'D:\Google Drive\5 Semestre\Lab BD\Projeto 1\HSL_Janeiro2021\HSL_Pacientes_3.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY Paciente(
	id_paciente,
	ic_sexo,
	aa_nascimento,
	cd_pais,
	cd_uf,
	cd_municipio,
	ce_reproduzido
)
FROM 'D:\Google Drive\5 Semestre\Lab BD\Projeto 1\HC_Janeiro2021\HC_PACIENTES_1.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY Exame(
	id_paciente,
	id_atendimento,
	dt_coleta,
	de_origem,
	de_exame,
	de_analito,
	de_resultado,
	cd_unidade,
	de_valor_referencia
)
FROM 'D:\Google Drive\5 Semestre\Lab BD\Projeto 1\HSL_Janeiro2021\HSL_Exames_3.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY Exame(
	id_paciente,
	id_atendimento,
	dt_coleta,
	de_origem,
	de_exame,
	de_analito,
	de_resultado,
	cd_unidade,
	de_valor_referencia
)
FROM 'D:\Google Drive\5 Semestre\Lab BD\Projeto 1\HC_Janeiro2021\HC_EXAMES_1.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY Desfecho(
	id_paciente,
	id_atendimento,
	dt_atendimento,
	de_tipo_atendimento,
	id_clinica,
	de_clinica,
	dt_desfecho,
	de_desfecho
)
FROM 'D:\Google Drive\5 Semestre\Lab BD\Projeto 1\HSL_Janeiro2021\HSL_Desfechos_3.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

--CONSULTAS

SELECT COUNT(*) FROM Paciente;
SELECT COUNT(*) FROM Exame;
SELECT COUNT(*) FROM Desfecho;

SELECT DISTINCT COUNT(ID_PACIENTE) FROM Paciente;
SELECT DISTINCT COUNT(DE_EXAME) FROM Exame;