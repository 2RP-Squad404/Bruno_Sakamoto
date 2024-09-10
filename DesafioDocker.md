# DesafioDocker

## Inicializar o arquivo
```python
# Esse comando serve para carregar e exibir dados em um notebook
%livy.pyspark

# Esse comando inicializa a leitura, especifica que o arquivo possui um cabeçalho e carrega o arquivo CSV
df = spark.read.option("header","true").csv("s3a://desafio/purchases_2023.csv")

df.show() # Esse comando exibe as primeiras 20 linhas do DataFrame
```
## Filtro por Data
```python
%livy.pyspark
from pyspark.sql.functions import col, month

# Esse comando filtra os dados para um mês específico, por exemplo, abril 
df_filtered = df.filter(month(col('purchase_date')) == 4)

df_filtered.show()
```
## Seleção de Colunas (Removi a coluna "product_name" pois já tendo o ID do produto, não seria necessário ter o nome)
```python
%livy.pyspark

# Esse comando remove a coluna 'product_name'
df_selected = df.drop("product_name")

# Esse comando mostra as colunas restantes
df_selected.show()
```
## Tratamento de Dados
```python
%livy.pyspark
from pyspark.sql.functions import col
from pyspark.sql.functions import round, col

# Comando utilizado para realizar a remoção de dados iguais
df = df.distinct()

# Comando utilizado para remover os valores nulos
df = df.na.drop()

# Comando para criar uma nova coluna com o preço final do produto
df = df.withColumn("total_price", col("amount") * col("price") - col("discount_applied")

# Comando usado para limitar a quantidade de casas depois da vírgula no preço
df = df.withColumn("price", round(col("price"), 2))
df = df.withColumn("total_price", round(col("total_price"), 2))
```

[Comandos](https://learn.microsoft.com/pt-br/azure/databricks/pyspark/basics)
