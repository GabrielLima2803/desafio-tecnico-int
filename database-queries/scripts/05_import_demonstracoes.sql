LOAD DATA INFILE '/data/2024/1T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2024/2T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2024/3T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2024/4T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2023/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2023/2T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2023/3T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');

LOAD DATA INFILE '/data/2023/4T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(data, registro_ans, cd_conta_contabil, descricao, @vl_saldo_inicial, @vl_saldo_final)
SET 
    data = STR_TO_DATE(data, '%d/%m/%Y'),
    vl_saldo_inicial = NULLIF(REPLACE(@vl_saldo_inicial, ',', '.'), ''),
    vl_saldo_final = NULLIF(REPLACE(@vl_saldo_final, ',', '.'), '');
