--JOIN NA TABELA FATO

SELECT * FROM tb_fato INNER 
JOIN tb_construtor ON tb_fato.construtor_id = tb_construtor.construtor_id_construtor 
INNER JOIN tb_circuito ON tb_fato.circuito_id = tb_circuito.circuito_id_circuito 
INNER JOIN tb_corrida ON tb_fato.corrida_id = tb_corrida.corrida_id_corrida 
INNER JOIN tb_piloto ON tb_fato.piloto_id = tb_piloto.piloto_id_piloto;


-- CRIANDO AS TABELAS:

DROP TABLE tb_corrida CASCADE;
CREATE TABLE tb_corrida (
	corrida_id_corrida INTEGER PRIMARY KEY,
    ano_corrida INTEGER NOT NULL,
    rodada_corrida INTEGER,
  	nome_corrida VARCHAR,
	data_corrida DATE
);
--DERRUBAR circuito do DATASET na hora da importação

--SELECT * FROM tb_corrida;

DROP TABLE tb_circuito CASCADE;
CREATE TABLE tb_circuito (
	circuito_id_circuito INTEGER PRIMARY KEY,
	circuito_ref_circuito VARCHAR,
	nome_circuito VARCHAR,
    localizacao_circuito VARCHAR,
    pais_circuito VARCHAR NOT NULL,
    latitude_circuito NUMERIC(3,2),
   	longitude_circuito NUMERIC(3,2),
    altitude_circuito NUMERIC(3,2)	
);

--SELECT * FROM tb_circuito;

DROP TABLE tb_piloto CASCADE;
CREATE TABLE tb_piloto (
	piloto_id_piloto INTEGER PRIMARY KEY,
	piloto_ref_piloto VARCHAR,
	numero_piloto VARCHAR,
    codigo_piloto VARCHAR,
    nome_piloto VARCHAR NOT NULL,
    sobrenome_piloto VARCHAR NOT NULL,
    dt_nascimento_piloto DATE,
    nacionalidade_piloto VARCHAR
);

--SELECT * FROM tb_piloto;

DROP TABLE tb_construtor CASCADE;
CREATE TABLE tb_construtor (
	construtor_id_construtor INTEGER PRIMARY KEY,
	construtor_ref_construtor VARCHAR,
    nome_construtor VARCHAR NOT NULL,
    nacionalidade_construtor VARCHAR
);

--SELECT * FROM tb_construtor;

DROP TABLE tb_fato CASCADE;
CREATE TABLE tb_fato (
    corrida_id INTEGER NOT NULL,
	piloto_id INTEGER NOT NULL,
	circuito_id INTEGER NOT NULL,
    construtor_id INTEGER NOT NULL,
    numero NUMERIC (3,2),
    grid INTEGER,
    posicao_ordem INTEGER,
    pontos NUMERIC (3,2),
	CONSTRAINT tb_fato_corrida_id_fk
		FOREIGN KEY (corrida_id) REFERENCES tb_corrida (corrida_id_corrida), 
	CONSTRAINT tb_fato_circuito_id_fk
		FOREIGN KEY (circuito_id) REFERENCES tb_circuito (circuito_id_circuito),
	CONSTRAINT tb_fato_piloto_id_fk
		FOREIGN KEY (piloto_id) REFERENCES tb_piloto (piloto_id_piloto),
	CONSTRAINT tb_construtor_id_fk
		FOREIGN KEY (construtor_id) REFERENCES tb_construtor (construtor_id_construtor)
);


