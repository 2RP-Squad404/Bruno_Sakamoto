#Linguagens e Frameworks

## Python
O Python é uma linguagem de programação utilizada para aplicações Web, desenvolvimento de softwares, ciência de dados e treinamento de inteligência artificial. Ele é eficiente e fácil de aprender, integra em todos os tipos de sistema e agiliza o desenvolvimento.

### Características do Python

- Foi projetado para ser fácil de ler e escrever, tornando-o compreensível para desenvolvedores iniciantes e experientes.
- Aumento de produtividade dos desenvolvedores, pois é possível escrever um programa em Python utilizando menos linhas de código que em outras linguagens.
- Possui uma grande biblioteca-padrão, que contém códigos reutilizáveis, assim, não é necessário escrever códigos do zero.
- Possui uma comunidade ativa e tem milhões de desenvolvedores de suporte no mundo.

### Benefícios do Python
- Fácil de ler e entender por conta da sistaxe básica semelhante a do inglês.
- Usado em diversas áreas, como desenvolvimento web, análise de dados, automação, inteligência artificial e mais.
- Possui diversos recursos, bibliotecas e frameworks que facilitam o desenvolvimento.
- Python é multiplataforma, o que significa que o mesmo código pode rodar em diferentes sistemas operacionais.
- Python se integra bem com outras linguagens, como C, C++ e Java, permitindo o desenvolvimento de soluções híbridas.

### Principais comandos: 
```python
print("Hello, World!") # print(): Exibe mensagens no console.
```

```python
def my_function(param):
    return param * 2 # def: Define uma função.
```

```python
import numpy as np # import: Importa módulos e pacotes.
```

```python
if __name__ == "__main__":
    main() # if (condição)":: Executa código apenas quando o script é executado diretamente.
```

```python
for i in range(5):
    print(i)

while (condição):
    # do something # for / while: Laços de repetição.
```
## Apache Spark (PySpark)
O Apache Spark é um mecanismo de análise unificado para processamento de dados em grande escala com módulos integrados para SQL, streaming, machine learning e processamento de gráficos. 
Com o Spark, os programadores podem escrever aplicativos rapidamente em Java, Scala, Python, R e SQL, o que o torna acessível a desenvolvedores, cientistas de dados e executivos avançados com experiência em estatística. Ao usar o Spark SQL, os usuários podem se conectar a qualquer fonte de dados e apresentá-la como tabelas a serem consumidas por clientes SQL. Além disso, algoritmos interativos de machine learning são facilmente implementados no Spark.

### Benefícios do Apache Spark
- Alto desempenho para dados em lote e de streaming usando um programador gráfico acíclico direcionado de última geração, um otimizador de consulta e um mecanismo de execução físico.
- Suporta várias linguagens de programação, incluindo Python e Java, o que facilita sua adoção por desenvolvedores com diferentes backgrounds.
- O Spark capacita uma pilha de bibliotecas, incluindo SQL e DataFrames, MLlib para machine learning. Sendo uma solução completa para necessidades de big data.
- Poder coletivo de uma comunidade de código aberto que oferece mais ideias, desenvolvimento mais rápido e solução imediata de problemas, o que possibilita um tempo de lançamento mais rápido. 

### Principais comandos: 
```python
df = spark.read.csv("path/to/file.csv") # spark.read: Lê dados de diferentes fontes.
```
```python
df.select("column1", "column2") # df.select(): Seleciona colunas específicas.
```
```python
df.filter(df["column"] > 10) # df.filter(): Filtra linhas com base em uma condição.
```
```python
df.groupBy("column").agg({"another_column": "sum"}) # df.groupBy(): Agrupa dados.
```
```python
df.write.csv("path/to/output.csv") # df.write: Salva dados em diferentes formatos.
```

## Apache Beam e Google Dataflow
O Apache Beam e o Google Dataflow são ferramentas para grandes processamentos de dados, especialmente em Big Data.

### Apache Beam
O Apache Beam é um modelo unificado e de código aberto para definição de pipelines e lote em streaming. Possui como objetivo a unificação de diferentes engines de processamento de dados e SDKs (Software Development Kits), baseado no modelo de Dataflow.

Principais Características:
- Facilita a criação de pipelines, oferece uma API unificada para processamento em lotes e em tempo real, podendo ser operadas em diferentes modos de execução.
- Os papilines criados com o Apache Beam podem ser executados em direntes máquinas virtuais, como o Google Dataflow.
- Suporta várias linguagens, incluindo Java, Python, e Go, permitindo que você use a linguagem com a qual está mais confortável.

### Principais comandos: 
```python
with beam.Pipeline() as p:
    result = (
        p | 'Read' >> beam.io.ReadFromText('input.txt')
          | 'Transform' >> beam.Map(lambda x: x.upper())
          | 'Write' >> beam.io.WriteToText('output.txt')
    ) # Pipeline: Define um pipeline de processamento de dados.
```
```python
p | beam.Map(lambda x: x * 2) # beam.Map(): Aplica uma função a cada elemento.
```
```python
p | beam.Filter(lambda x: x > 10) # beam.Filter(): Filtra elementos com base em uma condição.

```
```python
p | beam.GroupByKey() # beam.GroupByKey(): Agrupa elementos por chave.
```

### Google Dataflow
O Dataflow é um serviço do Google Cloud que fornece processamento unificado de dados de stream e em lote em escala. 

Principais Características:
- O Dataflow é um serviço totalmente gerenciado. Isso significa que o Google gerencia todos os recursos necessários para executar o Dataflow. 
- Ajusta automaticamente a capacidade de processamento conforme a carga de trabalho, otimizando custos e desempenho.
- Oferece ferramentas de monitoramento e visualização para acompanhar o status e o desempenho dos pipelines em execução.
- O Dataflow é pago conforme o uso, o que permite que as organizações otimizem seus custos com base na demanda real de processamento de dados.

### Principais comandos: 
```python
options = PipelineOptions()
options.view_as(StandardOptions).runner = 'DataflowRunner' # --runner=DataflowRunner: Define o runner para o pipeline.
```
```python
options.view_as(GoogleCloudOptions).project = 'my-project-id' # --project: Define o projeto do Google Cloud.
```
```python
options.view_as(GoogleCloudOptions).temp_location = 'gs://my-bucket/temp/'
# --temp_location: Define o local temporário para armazenamento.

```
```python
options.view_as(GoogleCloudOptions).staging_location = 'gs://my-bucket/staging/'
# --staging_location: Define o local para arquivos de staging.

```

## Apache Airflow
Apache Airflow é uma plataforma de código aberto para orquestração e automação de workflows de dados. O Airflow permite que você defina, agende e monitore workflows de dados complexos de forma eficiente e escalável.

### Principais Características
- Permite que você defina e agende tarefas, como extração de dados, transformação e carregamento, e coordene a execução dessas tarefas de forma dependente.
- Inclui mecanismos para retry automático de tarefas falhas e recuperação de erros, aumentando a robustez dos workflows.
- Permite a execução paralela de tarefas e pode ser escalado para lidar com grandes volumes de tarefas e dados.

### Principais comandos: 
```python
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator

dag = DAG('my_dag', start_date=datetime(2021, 1, 1))

start = DummyOperator(task_id='start', dag=dag)
end = DummyOperator(task_id='end', dag=dag)

start >> end
# dag: Define um Directed Acyclic Graph (grafo acíclico dirigido) para o workflow.
```
```python
from airflow.operators.python_operator import PythonOperator

def my_function():
    print("Hello from Airflow")

task = PythonOperator(
    task_id='my_task',
    python_callable=my_function,
    dag=dag
)
# task: Define uma tarefa no DAG.
```
```python
dag = DAG('my_dag', schedule_interval='@daily', start_date=datetime(2021, 1, 1))
# schedule_interval: Define a frequência de execução do DAG.
```
```python
from airflow.utils.dates import days_ago

task = PythonOperator(
    task_id='my_task',
    python_callable=my_function,
    trigger_rule='all_success',
    dag=dag
)
# trigger_rule: Define regras de disparo para execução de tarefas.
```

## Fontes
[Fonte1](https://github.com/2RP-Squad404/Data_Science/blob/main/wiki/subpages/linguagens_frameworks.md)
[Fonte2](https://aws.amazon.com/pt/what-is/python/)

[Fonte3](https://cloud.google.com/learn/what-is-apache-spark?hl=pt-BR)
[Fonte4](https://deinfo.uepg.br/~alunoso/2020/SO/ApacheBeam/introducao.html)

[Fonte5](https://cloud.google.com/dataflow/docs/overview?hl=pt-br)
