LOAD DATA INFILE '/data/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(registro_ans, 
 cnpj, 
 razao_social, 
 nome_fantasia, 
 modalidade, 
 logradouro, 
 numero, 
 complemento, 
 bairro, 
 cidade, 
 uf, 
 cep, 
 ddd, 
 telefone, 
 fax, 
 endereco_eletronico, 
 representante, 
 cargo_representante, 
 @regiao, 
 data_registro_ans)
SET regiao_de_comercializacao = NULLIF(@regiao, '');
