📦 Sistema de Pedidos e Controle de Estoque

Projeto completo de modelagem e implementação de banco de dados, desenvolvido como projeto acadêmico/portfólio, demonstrando domínio do ciclo completo de modelagem de dados, desde o modelo conceitual até otimização de consultas em Oracle SQL.

📋 Sobre o Projeto
Sistema completo para gestão de pedidos de venda, contemplando clientes pessoa física e jurídica, vendedores, produtos, controle de estoque, faturamento e validações automáticas.
O projeto foi desenvolvido seguindo rigorosamente as etapas da modelagem de dados, incluindo DER, normalização, implementação física, regras de negócio e otimização de desempenho.

🎯 Funcionalidades Principais
✅ Cadastro de Clientes PF e PJ (com especialização)
 ✅ Controle de Pedidos e Itens de Pedido
 ✅ Gestão de Produtos e Vendedores
 ✅ Controle de Estoque por entradas e saídas
 ✅ Validação automática de disponibilidade de estoque
 ✅ Endereço de entrega independente do cliente
 ✅ Geração automática de valores de itens e total da fatura
 ✅ Logs automáticos de inserção, alteração e exclusão
 ✅ Views consolidadas para consulta de clientes e estoque
 ✅ Otimização de consultas com índices e análise de plano de execução

🏗️ Arquitetura do Projeto
Fases de Desenvolvimento
Levantamento de Requisitos
 └── Regras de negócio e cenários de venda
Modelagem Conceitual (DER)
 └── Entidades, relacionamentos, cardinalidades e especializações
Modelagem Lógica
 └── Normalização até 3ª Forma Normal (3FN)
Modelagem Física
 └── Implementação em Oracle SQL com constraints, triggers e índices

📊 Modelagem de Dados
1️⃣ Modelo Conceitual (DER)
![modelo_conceitual(1)](https://github.com/joaovicente04/PROJETOS_SQL/blob/main/Sistema%20de%20Pedidos%20e%20Controle%20de%20Estoque/Diagrama-Conceitual/modelo_conceitual(1).jpg?raw=true)

Principais Decisões de Modelagem:
Especialização de CLIENTE em PF e PJ
 Cliente pode ser Pessoa Física ou Pessoa Jurídica (disjunta e parcial)


Entidade Associativa ITEM_PRODUTO
 Resolve relacionamento N:N entre PEDIDO e PRODUTO, mantendo histórico de preços


Controle de Estoque por Entradas
 Estoque registra entradas por data/lote, garantindo rastreabilidade


Endereço de Entrega no Pedido
 Permite entregas em endereço diferente do cadastro do cliente


Atributos Multivalorados
 Telefones separados em tabelas próprias (FONE_CLIENTE e FONE_VENDEDOR)



Entidades do Sistema
Principais:
CLIENTE


PF (Pessoa Física)


PJ (Pessoa Jurídica)


VENDEDOR


PRODUTO


PEDIDO


ITEM_PRODUTO


ESTOQUE


PRATELEIRA


CAPACIDADE_ESTOQUE


Auxiliares:
FONE_CLIENTE


FONE_VENDEDOR




2️⃣ Modelo Lógico Relacional
<img width="1430" height="1001" alt="Logical" src="https://github.com/joaovicente04/PROJETOS_SQL/blob/main/Sistema%20de%20Pedidos%20e%20Controle%20de%20Estoque/Diagrama-Logico/Logical.png?raw=true" />

Normalização Aplicada
✅ Primeira Forma Normal (1FN)
Atributos atômicos


Sem grupos repetitivos


✅ Segunda Forma Normal (2FN)
Eliminação de dependências parciais


Atributos dependem totalmente da PK


✅ Terceira Forma Normal (3FN)
Eliminação de dependências transitivas


Redução de redundância


Estrutura Geral
12 tabelas normalizadas


Relacionamentos implementados via FKs


Entidades associativas bem definidas



3️⃣ Modelo Físico (Oracle SQL)
Características Técnicas
SGBD: Oracle Database


Linguagem: SQL / PL-SQL


Total de Tabelas: 12


Views: 2


Triggers: 3


Sequences: 2


Índices: Criados para otimização de performance



🔐 Constraints Implementadas
Chaves Primárias (PK)
Todas as tabelas possuem PK definida


Chaves compostas em entidades associativas


Chaves Estrangeiras (FK)
Integridade referencial em todos os relacionamentos


UNIQUE
CPF (PF)


CNPJ (PJ)


CHECK
Validação de número do pedido


Regras de consistência de dados



🔁 Triggers Implementadas
Trigger
Função
TRG_LOG_ALTERACOES_BD
Registra INSERT, UPDATE e DELETE
TRG_VALIDA_ESTOQUE
Impede venda sem estoque disponível
TRG_LOG_ALTR_BI
Geração automática de IDs de log


👁️ Views Criadas
VIEW_CLIENTE
Consolida dados de CLIENTE, PF e PJ em uma única visualização lógica.
VIEW_ESTOQUE
Exibe:
Quantidade adquirida


Quantidade vendida


Saldo disponível por produto



🔍 Índices e Otimização
Índices criados em campos de busca frequente


Análise com EXPLAIN PLAN


Redução de custo de CPU após otimização (~3%)



📁 Estrutura do Projeto
Sistema-Pedidos/
│
├── README.md
├── Diagramas/
│   ├── DER_Modelo_Conceitual.png
│
├── Scripts/
│   ├── ddl_criacao_tabelas.sql
│   ├── dml_insercao_dados.sql
│   ├── queries_consulta.sql
│   ├── triggers.sql
│
├── Views/
│   ├── view_cliente.sql
│   └── view_estoque.sql
│
└── Documentacao/
   ├── Normalizacao.pdf
   └── Regras_de_Negocio.pdf

🎯 Regras de Negócio Implementadas
Código
Regra
Implementação
RN01
Cliente pode ser PF ou PJ
Especialização
RN02
Pedido deve ter cliente e vendedor
FK obrigatória
RN03
Pedido pode ter vários produtos
ITEM_PRODUTO
RN04
Não vender sem estoque
Trigger
RN05
Histórico de preço por item
Preço no ITEM_PRODUTO
RN06
CPF e CNPJ únicos
UNIQUE
RN07
Total do pedido calculado
UPDATE + agregação
RN08
Logs automáticos
Trigger


🛠️ Tecnologias Utilizadas
Banco de Dados: Oracle Database


Modelagem Conceitual: brModelo


Modelagem Lógica: DER Relacional


Linguagem: SQL / PL-SQL


Normalização: Até 3FN


Controle de Versão: Git



🎓 Conceitos Demonstrados
✅ Modelagem Conceitual (DER)
 ✅ Modelagem Lógica e Normalização
 ✅ Modelagem Física
 ✅ SQL Avançado
 ✅ Triggers e Views
 ✅ Regras de Negócio
 ✅ Integridade Referencial
 ✅ Otimização de Consultas
 ✅ Documentação Técnica Profissional

📈 Métricas do Projeto
12 tabelas normalizadas


10+ relacionamentos (FKs)


3 triggers


2 views


2 sequences


20+ queries SQL


8 regras de negócio implementadas


Normalização até 3FN


👤 Autor

João Vicente Burin Souza


GitHub: @joaovicente04

LinkedIn: https://www.linkedin.com/in/jo%C3%A3o-vicente-burin-28246635b/
Email: joaovicenteburin2004@gmail.com
