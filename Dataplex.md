# Dataplex

## ***Catálogo***
Oferece um catálogo de dados unificado para facilitar a descoberta e o gerenciamento de ativos de dados em ambientes híbridos e multi-cloud.

### Funções:
- Ele centraliza a descoberta de dados de maneira eficiente e facilita o acesso para diferentes equipes e usuários.
- ELe organiza os ativos de dados, metadados e esquemas, permitindo a gestão eficiente de conjuntos de dados.
- O Dataplex pode automaticamente classificar e rotular dados com base em padrões predefinidos. Isso é útil para
identificação de dados sensíveis, como informações pessoais (PII), o que contribui para conformidade com regulamentos como a LGPD e GDPR.
- O catálogo também facilita a implementação de políticas de governança de dados e controle de acesso. Ele integra com o IAM do Google Cloud
para garantir que os dados estejam protegidos e que o acesso seja controlado de acordo com as necessidades da organização.
- O Dataplex permite monitorar e gerenciar a qualidade dos dados, detectando inconsistências, valores ausentes e outras anomalias nos conjuntos de dados.

### Lake
Lake é um ponto de entrada principal para organizar, gerenciar e governar dados de forma centralizada.

- Dentro de um Lake, os dados são organizados em Zones, que são áreas lógicas dentro do Lake usadas para segmentar 
dados com diferentes finalidades. Essas zones podem ser usadas para organizar dados por equipe, departamento ou 
tipo de uso (ex.: dados brutos, dados transformados, etc.).
- O Lake permite que você aplique políticas de governança consistentes em todos os ativos de dados, o que inclui
controle de acesso, auditoria e conformidade com normas de proteção de dados. Ele também facilita a criação de regras
de segurança e a aplicação de criptografia para proteger os dados armazenados.
- O Dataplex oferece funcionalidades para garantir que os dados no Lake atendam a padrões de qualidade predefinidos.
Isso inclui a capacidade de monitorar a consistência, completude e integridade dos dados em diferentes ativos.
- Com a ajuda de machine learning, o Dataplex Lakes pode automatizar a classificação e a categorização de dados,
permitindo uma gestão mais eficiente e com menos trabalho manual. A inteligência artificial pode ser usada para
detectar padrões em dados, rotular automaticamente e aplicar políticas de conformidade, como a identificação de dados sensíveis.

### Zones
São agrupamentos lógicos de dados não estruturados, semiestruturados e estruturados e consiste em vários recursos, como buckets do Cloud Storage, conjuntos de dados e tabelas do BigQuery.

- Zonas Brutas: As zonas brutas armazenam dados estruturados e semiestruturados, como arquivos CSV Arquivos JSON e dados não estruturados em qualquer formato de fontes externas. Isso é útil para preparar dados brutos antes de realizar qualquer transformação.
- Zonas Selecionadas: As zonas selecionadas armazenam dados estruturados. Os dados podem ser armazenados em buckets do Cloud Storage ou conjuntos de dados do BigQuery.
Os formatos compatíveis com os buckets do Cloud Storage incluem Parquet, Avro e ORC. Isso é útil para testar dados que precisam ser processados antes de serem usados ou para disponibilizar dados prontos para análise.
