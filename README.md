# projeto-banco-de-dados-oficina

# 🛠️ Projeto de Banco de Dados — Oficina Mecânica  
Desenvolvido para o desafio de projeto do módulo de Banco de Dados.  
Este repositório contém **modelagem, criação do banco, inserção de dados, queries e documentação completa** de um sistema de gestão para uma **Oficina Mecânica**.

---

## ✅ 1. 📌 Descrição Geral do Projeto

Este projeto tem como objetivo construir um banco de dados completo para gerenciar os processos de uma **oficina mecânica**, incluindo:

- Cadastro de clientes  
- Cadastro de veículos  
- Funcionários (atendentes, mecânicos, gerentes…)
- Fornecedores  
- Peças e controle de estoque  
- Serviços  
- Ordens de serviço (OS)  
- Registro das peças e serviços utilizados  
- Pagamentos  
- Agendamentos  

O banco foi modelado seguindo práticas de normalização, integridade referencial e clareza estrutural.

---

## ✅ 2. 🧩 Modelo Relacional (Lógico)

> **Insira aqui a imagem do seu MODELO RELACIONAL.  
Use o formato:**  
> `![Modelo Relacional](img/modelo-relacional.png)`

---

## ✅ 3. 🗄️ Estrutura do Banco (DDL)

O arquivo contém todo o script para criação do schema:

✅ Criação do banco  
✅ Tabelas completas  
✅ PK, FK, relacionamentos, cascatas e restrições  
✅ Tipos ENUM representando estados do sistema  
✅ Relacionamentos N:N resolvidos com tabelas associativas

> 📄 Arquivo: **`ddl_oficina.sql`**

---

## ✅ 4. 🧪 Inserts de Teste (DML)

Foram criados **8 a 10 registros por tabela**, garantindo volume suficiente para testes de consultas, junções e agrupamentos.

As tabelas preenchidas incluem:

- Cliente  
- Funcionario  
- Veiculo  
- Fornecedor  
- Peca  
- Estoque  
- Servico  
- OrdemServico  
- OrdemItemServico  
- OrdemItemPeca  
- Pagamento  
- Agendamento  

> 📄 Arquivo: **`inserts_oficina.sql`**

---

## ✅ 5. 🔍 Queries Solicitadas no Desafio

Foram criadas queries completas utilizando:

✅ SELECT  
✅ WHERE  
✅ ORDER BY  
✅ HAVING  
✅ JOIN  
✅ GROUP BY  
✅ Subqueries  
✅ Expressões derivadas  
✅ Views  
✅ Consultas extras mais avançadas  

> 📄 Arquivo: **`queries_oficina.sql`**

---

## ✅ 6. 📊 Exemplos de Perguntas Respondidas

Algumas perguntas que as queries permitem responder:

- Quais clientes têm veículos cadastrados?  
- Quanto cada serviço faturou no mês?  
- Quais OS utilizam peças específicas?  
- Qual o estoque total da oficina?  
- Quanto foi gasto em peças por ordem de serviço?  
- Quais funcionários estão ativos atualmente?  
- Qual a previsão de faturamento da oficina por forma de pagamento?  
- Quais serviços foram executados em cada OS?  
- Quais clientes possuem agendamentos futuros?

---

## ✅ 7. 🧠 Regras de Negócio Consideradas

- Uma OS sempre possui: cliente, veículo, atendente e mecânico.  
- Uma OS pode ter **vários serviços** e **várias peças**.  
- Cada peça pertence a **um fornecedor**.  
- Cada peça possui um registro único de estoque (relação 1:1).  
- Um cliente pode ter vários veículos.  
- Pagamentos estão ligados diretamente à OS.  
- Agendamentos vinculam cliente + veículo + serviço.  
- Funcionários têm cargos pré-definidos (ENUM).

---

## ✅ 8. 🏗️ Tecnologias Utilizadas

- ✅ **MySQL 8+**  
- ✅ **Workbench** (opcional)  
- ✅ Scripts SQL  
- ✅ Markdown para documentação

---

## ✅ 9. 📁 Estrutura do Repositório


```
📦 oficina-mecanica-mysql
oficina-db/
│
├── README.md
│
├── sql/
│   ├── 01_ddl_create_tables.sql
│   ├── 02_inserts.sql
│   ├── 03_queries.sql
│
└── docs/
    ├── modelo_relacional.png   ← você vai colocar a foto aqui
    └── diagrama_entidade_relacionamento.png (opcional)

```


---

## ✅ 10. 👩‍💻 Autor(a)

Projeto desenvolvido por **Joana Cristina C. Silva** ✨  
Como parte do desafio do módulo de Banco de Dados, curso: DIO.

---

## ✅ 11. ✅ Status do Projeto

🟩 **Concluído e funcionando.**  
Scripts testados e validados.

---

## ✅ 12. 📜 Licença

Este projeto é livre para uso acadêmico e estudos.

---


