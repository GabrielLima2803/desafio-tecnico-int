# Como Subir o Container e Usar o MySQL

Este guia irá te ajudar a configurar e executar o MySQL dentro de um container Docker, e em seguida realizar consultas (queries) para interagir com o banco de dados.

## 1. Subindo o Container MySQL

### Passo 1: Preparar o Ambiente

1. **Certifique-se de que o Docker está instalado**. Se ainda não tiver, siga as instruções de instalação do Docker para o seu sistema operacional [aqui](https://docs.docker.com/get-docker/).

2. **Crie o arquivo `docker-compose.yml`** (se ainda não tiver um) com o seguinte conteúdo:

```yaml
version: '3.1'

services:
  mysql:
    image: mysql:latest
    container_name: mysql_container
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: seu_banco_de_dados
    ports:
      - "3306:3306"
    volumes:
      - ./data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
```

## 2. Subir o Container

### Passo 1: Subir o Container

Execute o seguinte comando no terminal para iniciar o container MySQL:

```bash
docker-compose up -d
```

Você pode verificar se o container está rodando com:

```bash
docker ps
```
## 3. Conectando ao MySQL

### Passo 1: Acessando o MySQL no Container

Agora que o container está rodando, você pode acessar o MySQL utilizando o cliente MySQL dentro do próprio container:

```bash
docker exec -it mysql_container mysql -u root -p
```

### Passo 2: Usando o MySQL

Após entrar no MySQL, você pode executar comandos SQL. Aqui estão os dois exemplos de queries que você mencionou:

**Exemplo 1: Consultar as 10 operadoras com maiores despesas no último trimestre**

```sql
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
```

**Exemplo 2: Consultar as 10 operadoras com maiores despesas no último ano**

```sql
WITH ultimo_ano AS (
  SELECT 
    YEAR(MAX(data)) AS ano
  FROM demonstracoes_contabeis
)
SELECT 
  o.razao_social, 
  o.nome_fantasia, 
  SUM(d.vl_saldo_final) AS total_despesa
FROM demonstracoes_contabeis d
JOIN operadoras o ON d.registro_ans = o.registro_ans
JOIN ultimo_ano ua 
  ON YEAR(d.data) = ua.ano
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
GROUP BY o.razao_social, o.nome_fantasia
ORDER BY total_despesa DESC
LIMIT 10;
```

### Passo 3: Sair do MySQL

Quando terminar de rodar suas queries, você pode sair do cliente MySQL com o comando:

```sql
EXIT;
```