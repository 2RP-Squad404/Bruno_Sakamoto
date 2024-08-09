# Bancos de dados Transacionais

Bancos de dados transacionais são armazenamentos de linha, o que significa que os dados são armazenados no disco como linhas, em vez de colunas, são projetados para gerenciar e facilitar o processamento de transações em tempo real.

## Principais Características

- Processam operações rapidamente e de maneira eficiente, permitindo que as transações sejam concluídas em tempo real.
- Garantem que as transações sejam completadas de maneira consistente e confiável, usando propriedades ACID (Atomicidade, Consistência, Isolamento, Durabilidade).
- Suportam operações de criação, leitura, atualização e exclusão de dados.
- São otimizados para operações rápidas com baixa latência.
- Suportam um grande número de usuários simultâneos, mantendo a integridade dos dados.

## Como garantir a integridade dos dados
Os bancos de dados transacionais são arquitetados para serem compatíveis com ACID, o que garante que as gravações no banco de dados sejam bem-sucedidas ou falhem juntas, mantendo um alto nível de integridade de dados ao gravar dados no banco de dados.

### O que é "ACID":

- Atomicidade: Garante que todas as operações dentro de uma transação sejam completadas com sucesso ou, em caso de falha, nenhuma alteração seja feita no banco de dados.
- Consistência: Assegura que uma transação leva o sistema de um estado consistente a outro estado consistente, preservando as regras de integridade do banco de dados.
- Isolamento: Garante que as operações de uma transação não serão visíveis para outras transações até que a transação esteja completa. Isso evita problemas de concorrência, como leituras sujas ou desatualizadas.
- Durabilidade: Uma vez que uma transação é confirmada, suas mudanças no banco de dados são permanentes, mesmo em caso de falhas no sistema.

## Benefícios das Bases Transacionais

- Garantem que as transações sejam realizadas de maneira consistente e confiável.
- Assegura que, em caso de falha durante a execução de uma transação, todas as operações parciais sejam revertidas, deixando o banco de dados no estado anterior à transação.
- Otimizadas para operações rápidas e de baixa latência, permitindo processamento em tempo real.
- Capazes de gerenciar muitos usuários simultâneos sem comprometer a integridade dos dados.
- Podem ser escaladas para suportar grandes volumes de transações e dados.

## Obstáculos dos Sistemas Transacionais

- A implementação de transações pode ter um efeito prejudicial na eficiência do sistema, principalmente em ambientes com alto volume de solicitações simultâneas. As garantias de isolamento e consistência podem levar à introdução de bloqueios, o que pode retardar o acesso aos dados para outras transações, resultando em última análise na diminuição do desempenho.

- O dimensionamento horizontal de bancos de dados transacionais pode ser um desafio significativo, pois garantir a integridade das transações em sistemas distribuídos exige a implementação de mecanismos de coordenação intrincados.

- Manter a integridade das transações em sistemas distribuídos é uma tarefa extremamente difícil. Isto requer o uso de técnicas avançadas, como protocolos de confirmação bifásica ou trifásica, que podem aumentar a complexidade e a latência das transações.

- Projetar e manter um sistema que suporte transações de maneira confiável pode ser uma tarefa complexa, exigindo conhecimento especializado em sistemas de banco de dados.

## Fontes

[Fonte1](https://github.com/2RP-Squad404/Data_Science/blob/main/wiki/subpages/transacional.md)

[Fonte2](https://cloud.google.com/learn/what-are-transactional-databases?hl=pt-BR)

[Fonte3](https://www.devmedia.com.br/transformacao-de-bases-de-dados-transacionais-em-data-warehouse/34422)
