# CompreAqui--Empresa de Vendas📦
## O que é ❔
Este projeto se trata de um banco de dados de uma empresa fictícia do ramo de varejo, onde cada tabela faz parte da estrutura do funcionamento desse comércio. Cada pedaço desse projeto foi feito no intuito de reforçar o aprendizado em comandos do SQL e de bancos de dados, além de chaves estrangeiras para o profundo entendimento de relacionamentos com outras tabelas. Tudo foi feito no SGBD Microsoft SQL Server, com a linguagem nativa da ferramenta: T-SQL

## Como instalar ⬇️
### Execute o comando abaixo para ter o projeto na sua máquina
` git clone https://github.com/GabrielCv54/pp_empresa_vendas.git `

## Estrutura de criação

```
Tabela Fornecedor
 CREATE TABLE FORNECEDOR(
	ID_FORNECEDOR INTEGER PRIMARY KEY,
	NOME_FORNECEDOR VARCHAR(50),
	CONTATO INTEGER,
	ENDEREÇO TEXT,
   ); 


 Tabela Clientes
 ``` CREATE TABLE CLIENTES(
	CPF VARCHAR(11) PRIMARY KEY,
	NOME_CLIENTE VARCHAR(50),
	ENDEREÇO TEXT,
	TELEFONE BIGINT ,
	EMAIL VARCHAR(255),
	DATA_CADASTRO DATE
);

Tabela Produto
CREATE TABLE PRODUTO(
	ID_PRODUTO INTEGER PRIMARY KEY,
	NOME_PRODUTO VARCHAR(100),
	CATEGORIA VARCHAR(100),
	DESCRIÇÃO TEXT,
	QUANTIDADE INTEGER,
	PREÇO DECIMAL(10,2)
);

Tabela Vendas
CREATE TABLE VENDAS(
	ID_VENDA INTEGER PRIMARY KEY,
	CLIENTE_COMPRADOR VARCHAR(11) FOREIGN KEY REFERENCES CLIENTES(CPF),
	PRODUTO_VENDIDO INTEGER FOREIGN KEY REFERENCES PRODUTO(ID_PRODUTO),
	PAGAMENTO VARCHAR(25)
);
```
