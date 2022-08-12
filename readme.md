# IaC - Infraestrutura como Código

## Benefícios
- Padronização
- Redução de tempo

## Estrutura que será criada

### Diretórios
- /publico
- /admin
- /ven
- /sec

### Grupos
- GRP_ADM
    - carlos
    - maria
    - joao
- GRP_VEN
    - debora
    - sebastiana
    - roberto
- GRP_SEC
    - josefina
    - amanda
    - rogerio

### Usuários
- carlos
- maria
- joao
- debora
- sebastiana
- roberto
- josefina
- amanda
- rogerio

## Definições
- Todo provisionamento deve ser feito em uma arquivo do tipo Bash Script;
- O dono de todos os diretórios criados será o usuário root;
- Todos os usuários terão permissão total dentro do diretório `publico`;
- Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
- Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamento que eles não pertecem.

