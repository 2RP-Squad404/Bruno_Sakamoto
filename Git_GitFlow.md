# Git

É um sistema de controle de versão, portanto, ao invés de conter apenas um local para o histórico completo da versão do software, o Git contém o histórico de todas as alterações no código além da cópia completa do trabalho.
O Git facilita o trabalho em equipe, permitindo que diferentes programadores trabalhem em diferentes partes de um mesmo projeto, ou seja, devido ao histórico de versões, se algum arquivo for permitido, será possível recuperá-lo.

## Funcionalidades
- Criação de branches para desenvolver novas funcionalidades ou correções de bugs de forma isolada. E após corrigidas, podem ser integradas novamente ao trabalho principal.
- Acessar diferentes versões do trabalho e possuir um histórico de todas as alterações feitas durante o trabalho.
- Cópia completa dos trabalhos, portanto, isso possibilita que os desenvolvedores trabalhem sem acesso a internet.
- Otimização de velocidade mesmo em grandes projetos.

# GitFlow
GitFlow é um modelo alternativo de ramificação para Git. Ele É útil para equipes que adotam desenvolvimento de software ágil, facilitando o gerenciamento de todas as atividades realizadas durante o desenvolvimento do projeto. O GitFlow possui algumas ramificações que são as principais e as auxiliares.

![gitflow](https://github.com/user-attachments/assets/240244dc-27e3-4ae2-9591-7075842905d2)

### Branches Principais:
- main: Contém a versão principal do código. Cada atualização dentro dessa branch, significa uma nova versão de lançamento.
- develop: Contém o código que está sendo desenvolvido e que possui alterações que foram aprovadas pelos requisitantes do projeto.

### Branches Auxiliares:
- feature: usada para desenvolver novas funcionalidades. São criadas com base na "develop" e após serem concluídas, são unificadas de volta a própria "develop".
- release: é utilizada quando uma nova versão está pronta para lançamento. Ela é criada a partir de develop e após os ajustes finais, é integrada em main e develop.
-hotflix: é utilizadas para realizar correções urgentes. É criada a partir de main e é integrada em main e develop.

## Funcionalidades
- Facilita a administração e a organização do desenvolvimento de um projeto, dividindo as funcionalidades de cada desenvolvedor, agilizar a correção de bugs e possuir acesso as versões de produção.
- Permite que várias equipes trabalhem dentro de um mesmo projeto sem perigo de sobreposição dos trabalhos durante o processo.
- Redução de risco de lançamento de um código defeituoso por conta do controle e acesso a todas alterações realizadas.

#### Fontes:
[Fonte1](https://github.com/2RP-Squad404/Data_Science/blob/main/wiki/subpages/git.md)

[Fonte2](https://www.atlassian.com/br/git/tutorials/comparing-workflows/gitflow-workflow)

[Fonte3](https://www.alura.com.br/artigos/git-flow-o-que-e-como-quando-utilizar)

