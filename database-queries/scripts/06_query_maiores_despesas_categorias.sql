WITH ultimo_periodo AS (
  SELECT 
    YEAR(MAX(data)) AS ano,
    QUARTER(MAX(data)) AS trimestre
  FROM demonstracoes_contabeis
)
SELECT 
  o.razao_social, 
  o.nome_fantasia, 
  SUM(d.vl_saldo_final) AS total_despesa
FROM demonstracoes_contabeis d
JOIN operadoras o ON d.registro_ans = o.registro_ans
JOIN ultimo_periodo up 
  ON YEAR(d.data) = up.ano
  AND QUARTER(d.data) = up.trimestre
WHERE (d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR')
GROUP BY o.razao_social, o.nome_fantasia
ORDER BY total_despesa DESC
LIMIT 10;
