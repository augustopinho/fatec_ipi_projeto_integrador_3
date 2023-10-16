DROP TABLE tb_fato_piloto_construtor_DW CASCADE;
CREATE TABLE tb_fato_piloto_construtor_DW (
                resultado_id INTEGER NOT NULL,
                corrida_id INTEGER NOT NULL,
				piloto_id_piloto INTEGER,
				piloto_ref_piloto VARCHAR,
                numero_piloto VARCHAR,
                codigo_piloto VARCHAR,
                nome_piloto VARCHAR NOT NULL,
                sobrenome_piloto VARCHAR NOT NULL,
                dt_nascimento_piloto VARCHAR,
                nacionalidade_piloto VARCHAR,
                construtor_ref_construtor VARCHAR,
                nome_construtor VARCHAR NOT NULL,
                nacionalidade_construtor VARCHAR,
              	CONSTRAINT tb_fato_piloto_construtor_dw_pk PRIMARY KEY (resultado_id, corrida_id, piloto_id_piloto),
				CONSTRAINT fato_piloto_construtor_dw_resultado_id_fk
				FOREIGN KEY (resultado_id) REFERENCES tb_dimensao_resultado_DW ( resultado_id_resultado), 
				CONSTRAINT fato_piloto_construtor_dw_corrida_id_fk
				FOREIGN KEY (corrida_id) REFERENCES tb_dimensao_corrida_circuito_DW (corrida_id_corrida));

SELECT * FROM tb_fato_piloto_construtor_DW;

--DROP TABLE tb_dimensao_corrida_circuito_DW CASCADE;
CREATE TABLE tb_dimensao_corrida_circuito_DW (
                corrida_id_corrida INTEGER NOT NULL,
                circuito_id_circuito INTEGER NOT NULL,
                ano_corrida INTEGER NOT NULL,
                rodada_corrida INTEGER,
                nome_corrida VARCHAR,
                data_corrida VARCHAR,
                circuito_ref_circuito VARCHAR,
                nome_circuito VARCHAR,
                localizacao_circuito VARCHAR,
                pais_circuito VARCHAR NOT NULL,
                latitude_circuito REAL,
                longitude_circuito REAL,
                altitude_circuito REAL,
                CONSTRAINT tb_corrida_circuito_dw_pk PRIMARY KEY (corrida_id_corrida));				

SELECT * FROM tb_dimensao_corrida_circuito_DW;

--DROP TABLE tb_dimensao_resultado_DW CASCADE;
CREATE TABLE tb_dimensao_resultado_DW (
                resultado_id_resultado INTEGER NOT NULL,
                corrida_id_resultado INTEGER NOT NULL,
                piloto_id_resultado INTEGER NOT NULL,
                construtor_id_resultado VARCHAR NOT NULL,
                numero_resultado REAL,
                grid_resultado INTEGER,
                posicao_ordem_resultado INTEGER,
                pontos_resultado REAL,
                CONSTRAINT tb_resultado_dw_pk PRIMARY KEY (resultado_id_resultado));

SELECT * FROM tb_dimensao_resultado_DW;

SELECT piloto_ref_piloto, nome_piloto, sobrenome_piloto, nacionalidade_piloto, codigo_piloto, 
construtor_ref_construtor, nome_construtor, nacionalidade_construtor,
nome_corrida, rodada_corrida, ano_corrida, data_corrida, 
circuito_ref_circuito, nome_circuito, localizacao_circuito, pais_circuito
,grid_resultado, posicao_ordem_resultado, pontos_resultado
FROM tb_dimensao_resultado_DW
INNER JOIN tb_fato_piloto_construtor_DW ON resultado_id_resultado = resultado_id AND piloto_id_resultado = piloto_id_piloto
INNER JOIN tb_dimensao_corrida_circuito_DW ON corrida_id = corrida_id_corrida;