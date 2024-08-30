# Tarefa
## 1. Carregando os dados pelo Hive
Com esse comando, o dados são abertos em uma tabela SQL, ignorando sua primeira linha e separando suas colunas com ','. 
```python
%hive
CREATE TABLE IF NOT EXISTS campaign (
  id INT,
  id_campaign INT,
  type_campaign STRING,
  days_valid INT,
  data_campaign TIMESTAMP,
  channel STRING,
  return_status STRING,
  return_date TIMESTAMP,
  client_id STRING
)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1")
```
Esse comando irá carregar o arquivo do Minio e então inserir dentri da tabela 'campaign'.
```python
%hive

LOAD DATA INPATH 's3a://tarefa/campaigns_2023_hist2.csv'
INTO TABLE campaign
```

Com esse comando é possível acessar o conteúdo da tabela.
```python
%hive

SELECT * FROM campaign
```
![tabelaSQL](https://github.com/user-attachments/assets/88d38694-221c-40a5-b1cc-e60373723da8)

## 2. Tratando os Dados
Com esse comando, a data é organizada no padrão 'dd:MM:yyyy HH:mm'
```python
%hive

SELECT 
  id_campaign,
  type_campaign,
  days_valid,
  date_format(data_campaign, 'dd-MM-yyyy HH:mm') AS data_campaign_formatada,
  channel,
  return_status,
  date_format(return_date, 'dd-MM-yyyy HH:mm') AS return_date_formatada,
  client_id
FROM campaign
```
Com esse comando, todos as linhas que tiverem dados nulos serão ignoradas.
```python
%hive
SELECT *
FROM campaign
WHERE id_campaign IS NOT NULL
   AND type_campaign IS NOT NULL
   AND days_valid IS NOT NULL
   AND data_campaign IS NOT NULL
   AND channel IS NOT NULL
   AND return_status IS NOT NULL
   AND return_date IS NOT NULL
   AND client_id IS NOT NULL;
```
Com esse comando, é possível identificar todas os dados duplicados.
```python
%hive

SELECT id_campaign, type_campaign, COUNT(*) AS cnt
FROM campaign
GROUP BY id_campaign, type_campaign
HAVING COUNT(*) > 1
```
## 3. Criação da Querys
Com esse comando é possível filtrar a quantidade de acessos que cada campanha obteve ao longo do ano.
```python
%hive

SELECT
  id_campaign,
  COUNT(*) AS total_acessos
FROM
  campaign
WHERE
  YEAR(data_campaign) = 2023
GROUP BY
  id_campaign
ORDER BY
  total_acessos DESC
```
![tabelaSQLfiltro](https://github.com/user-attachments/assets/f6a2e632-596d-4c82-bf48-f6363272f433)

Com esse comando, é possível verificar a media de acessos que cada campanha obteve por mês.
```python
%hive

SELECT
  id_campaign,
  MONTH(data_campaign) AS mes,
  COUNT(*) / COUNT(DISTINCT MONTH(data_campaign)) AS media_acessos_por_mes
FROM
  campaign
WHERE
  YEAR(data_campaign) = 2023
GROUP BY
  id_campaign,
  MONTH(data_campaign)
ORDER BY
  id_campaign, mes
```
![tabelaMedia](https://github.com/user-attachments/assets/fb1e589d-ab29-4b00-a0dc-ff470b9cb026)

Com esse comando é possível verificar qual campanha teve o maior número de acessos.
```python
%hive

SELECT
  id_campaign,
  COUNT(*) AS total_acessos
FROM
  campaign
GROUP BY
  id_campaign
ORDER BY
  total_acessos DESC
LIMIT 1
```
![maiorAcessos](https://github.com/user-attachments/assets/e7fc53bc-1007-4888-ac5a-1031a2cfc877)

Com esses comandos, é possível identificar qual mês obteve a maior e a menor quantidade de acessos.
```python
%hive
-- Mês com o maior número de acessos
SELECT
  MONTH(data_campaign) AS mes,
  COUNT(*) AS total_acessos
FROM
  campaign
GROUP BY
  MONTH(data_campaign)
ORDER BY
  total_acessos DESC
LIMIT 1
```
```python
%hive
-- Mês com o menor número de acessos
SELECT
  MONTH(data_campaign) AS mes,
  COUNT(*) AS total_acessos
FROM
  campaign
GROUP BY
  MONTH(data_campaign)
ORDER BY
  total_acessos ASC
LIMIT 1
```

## 4. Análise dos Resultados
1. As campanhas que obtiveram maior quantidade de acessos são:
- 3376: 4995 acessos;
- 1852: 4994 acessos;
- 7069: 4992 acessos;
- 4386: 4990 acessos;
- 4730: 4990 acessos;
- 1359: 4998 acessos;
- 5689: 4988 acessos;
- 5126: 4988 acessos;
- 5606: 4987 acessos;
- 3208: 4982 acessos.

2. O meses que obtiveram as maiores quantidades de acessos foram os meses 4 e 5.
3. Devido as altas demandas exigidas, é mais recomendado que as campanhas sejam realizadas no mês de abriel e maio.
