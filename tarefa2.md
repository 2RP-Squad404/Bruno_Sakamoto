# ***Tarefa 2***
## Script
Esse script irá retornar essas colunas:
- client_id
- total_price
- most_purchase_location
- first_purchase
- last_purchase
- most_campaign
- quantity_error
- date_today
- anomes_today
-----------------------------------------------------------------------------

<img width="890" alt="tarefa2" src="https://github.com/user-attachments/assets/ac970b9c-acdb-4459-8c7a-f4c911d2f64e">

## Relatório
## 1. Criação da Tabela consolidated_data
```python
CREATE TABLE consolidated_data AS
```
- Essa linha cria uma nova tabela chamada consolidated_data.
## 2. Seleção e Agregação dos Dados
```python
SELECT 
    p.client_id,
    SUM(p.price * p.amount * p.discount_applied) AS total_price,
```
- p.client_id: Seleciona o ID do cliente como uma das colunas da nova tabela.
- SUM(p.price * p.amount * p.discount_applied) AS total_price: Calcula o preço total das compras do cliente, multiplicando o preço pelo número de unidades e aplicando o desconto. A soma desses valores é armazenada na coluna total_price.

## 3. Local mais Utilizado para Compras
```python
    COALESCE(
        MAX(CASE WHEN p.purchase_location = 'website' THEN 'website' END),
        MAX(CASE WHEN p.purchase_location = 'app' THEN 'app' END),
        MAX(CASE WHEN p.purchase_location = 'store' THEN 'store' END)
    ) AS most_purchase_location,
```
- COALESCE: Essa função retorna o primeiro valor não-nulo dentre os valores fornecidos.
- MAX(CASE WHEN ...): As funções MAX e CASE WHEN são usadas para determinar a localização mais frequente das compras (website, aplicativo ou loja física). O valor correspondente ao local de compra é retornado.
- most_purchase_location: Armazena o local mais utilizado para compras na coluna most_purchase_location.

## 4. Primeira e Última Compra
```python
    MIN(p.purchase_datetime) AS first_purchase,
    MAX(p.purchase_datetime) AS last_purchase,
```
- MIN(p.purchase_datetime): Calcula a data da primeira compra do cliente e armazena na coluna first_purchase.
- MAX(p.purchase_datetime): Calcula a data da última compra do cliente e armazena na coluna last_purchase.

## 5. Campanha Mais Recebida
```python
    COALESCE(
        MAX(CASE WHEN c.id_campaign IS NOT NULL THEN c.id_campaign END),
        'No Campaign'
    ) AS most_campaign,
```
- MAX(CASE WHEN c.id_campaign IS NOT NULL THEN c.id_campaign END): Busca o ID da campanha mais frequente associada ao cliente. Se o cliente tiver recebido campanhas, o ID da campanha mais alta (mais recente) é retornado.
- 'No Campaign': Caso o cliente não tenha recebido nenhuma campanha, a string 'No Campaign' é atribuída.

most_campaign: Armazena a campanha mais recebida pelo cliente na coluna most_campaign.

## 6. Quantidade de Campanhas com Status "Error"
```python
    SUM(CASE WHEN c.return_status = 'error' THEN 1 ELSE 0 END) AS quantity_error,
```
- SUM(CASE WHEN c.return_status = 'error' THEN 1 ELSE 0 END): Conta quantas campanhas associadas ao cliente tiveram o status "error". O número total é armazenado na coluna quantity_error.

## 7. Data Atual Formatada
```python
    CURRENT_DATE() AS date_today,
    CAST(DATE_FORMAT(CURRENT_DATE(), 'MMyyyy') AS INT) AS anomes_today
```
- CURRENT_DATE(): Insere a data atual na coluna date_today, formatada como 'YYYY-MM-DD'.
- CAST(DATE_FORMAT(CURRENT_DATE(), 'MMyyyy') AS INT): Converte a data atual no formato 'MMyyyy' para um inteiro e armazena na coluna anomes_today.

## 8. Fonte de Dados e Junção
```python
FROM 
    purchase p
LEFT JOIN 
    campaign c
ON 
    p.client_id = c.client_id
```
- FROM purchase p: A consulta principal usa a tabela purchase (apelidada de p).
- LEFT JOIN campaign c ON p.client_id = c.client_id: Realiza uma junção à esquerda entre a tabela purchase e a tabela campaign, baseando-se no client_id. Isso garante que todos os registros de purchase sejam incluídos, mesmo que não haja uma correspondência na tabela campaign.

## 9. Agrupamento dos Resultados
```python
GROUP BY 
    p.client_id
```
- GROUP BY p.client_id: Agrupa os resultados por client_id, garantindo que todas as agregações e cálculos sejam feitas por cliente.
