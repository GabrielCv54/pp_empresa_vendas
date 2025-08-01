/*CREATE DATABASE EMPRESA_VENDAS; */

USE EMPRESA_VENDAS


/*CREATE TABLE FORNECEDOR(
	ID_FORNECEDOR INTEGER PRIMARY KEY,
	NOME_FORNECEDOR VARCHAR(50),
	CONTATO INTEGER,
	ENDEREÇO TEXT,
);*/

/*CREATE TABLE AQUISIÇÃO(
    ID_AQ INTEGER PRIMARY KEY,
	PRODUTOS_ENVIADOS VARCHAR(100),
	FORNECEDOR INTEGER FOREIGN KEY REFERENCES FORNECEDOR(ID_FORNECEDOR) NOT NULL,
	QUANTIDADE INTEGER,
	PREÇO_AQUISIÇÃO DECIMAL(10,2),
	DATA_AQUISIÇÃO DATE

);*/

/*CREATE TABLE CLIENTES(
	CPF VARCHAR(11) PRIMARY KEY,
	NOME_CLIENTE VARCHAR(50),
	ENDEREÇO TEXT,
	TELEFONE BIGINT ,
	EMAIL VARCHAR(255),
	DATA_CADASTRO DATE
);*/

/*CREATE TABLE PRODUTO(
	ID_PRODUTO INTEGER PRIMARY KEY,
	NOME_PRODUTO VARCHAR(100),
	CATEGORIA VARCHAR(100),
	DESCRIÇÃO TEXT,
	QUANTIDADE INTEGER,
	PREÇO DECIMAL(10,2)
);*/

/*CREATE TABLE SETOR(
	ID_SETOR INTEGER PRIMARY KEY,
	NOME_SETOR VARCHAR,
	DESCRIÇÃO VARCHAR(155),
	NUMERO_FUNCIONARIOS INTEGER
);*/


/*CREATE TABLE VENDAS(
	ID_VENDA INTEGER PRIMARY KEY,
	CLIENTE_COMPRADOR VARCHAR(11) FOREIGN KEY REFERENCES CLIENTES(CPF),
	PRODUTO_VENDIDO INTEGER FOREIGN KEY REFERENCES PRODUTO(ID_PRODUTO),
	PAGAMENTO VARCHAR(25)
);*/

/*CREATE TABLE FUNCIONARIOS(
	ID_FUNC INTEGER PRIMARY KEY,
	NOME_FUNC VARCHAR(155),
	CARGO TEXT,
	SALARIO DECIMAL(10,2),
	HORAS_TRABALHADAS VARCHAR(55),
	SETOR INTEGER FOREIGN KEY REFERENCES SETOR (ID_SETOR)
);*/

/*CREATE TABLE ITENS_VENDA(
   ID_ITEM INTEGER PRIMARY KEY,
   ID_VENDA INTEGER FOREIGN KEY REFERENCES VENDAS(ID_VENDA),
   PRODUTO INTEGER FOREIGN KEY REFERENCES PRODUTO(ID_PRODUTO),
   QUANTIDADE_VENDIDA INTEGER
);*/
 
/*CREATE DATABASE EMPRESA_VENDAS;

CREATE TABLE CLIENTE(
  ID_CLIENTE INTEGER PRIMARY KEY NOT NULL,
  NOME VARCHAR(50),
  EMAIL VARCHAR(100),
  CPF INTEGER,
  TELEFONE INTEGER(15),
  ENDEREÃ‡O VARCHAR(100)
  
);*/

/*CREATE TABLE FORNECEDOR(
	ID_FORNECEDOR INTEGER PRIMARY KEY NOT NULL,
	NOME VARCHAR(50),
	CNPJ TEXT,
	CONTATO INTEGER(15)
);*/
 
/*INSERT INTO CLIENTES VALUES('76263790040','MARCOS ROBERTO CARVALHO','RUA DOM ALMENDRA DOS REIS, 15555',684896321,'ROBERTITO@GMAIL.COM','2021-11-20')*/
/*INSERT INTO FORNECEDOR VALUES(5,'LEANDRO(FORNECEDOR MÓVEIS)','256995441','RUA EUNICO,0233')*/
/*INSERT INTO PRODUTO VALUES(100,'COMPUTADOR INTEL HD','TECNOLOGIA','UM COMPUTADOR DOS MAIS MODERNOS LANÇADOS PELA INTEL. ANO 2024, COM UMA MEMÓRIA RESISTENTE E POTENTE',50,2600.50)*/
/*INSERT INTO SETOR VALUES(200,'FINANCEIRO','DEPARTAMENTO RESPONSÁVEL POR CUIDAR DO DINHEIRO E DAS FINANÇAS ',45)*/
/*INSERT INTO AQUISI��O VALUES(1,'PRODUTOS ELETRÔNICOS',1,22);*/

/*UPDATE CLIENTES
SET NOME_SETOR = 2
WHERE NOME_SETOR = 'FINANCEIRO'*/

/*SELECT FRN.NOME_FORNECEDOR, FRN.ID_FORNECEDOR,FRN.ENDEREÇO
FROM FORNECEDOR FRN
WHERE FRN.ENDEREÇO = '[O]'*/


/*CREATE TABLE PAGAMENTO (
  ID_PGTO INTEGER PRIMARY KEY NOT NULL IDENTITY(1,1) ,
  ID_VENDA INTEGER FOREIGN KEY REFERENCES VENDAS(ID_VENDA),
  TIPO_DE_PAGAMENTO VARCHAR(50) NOT NULL,
  VALOR_PAGO VARCHAR(50) NOT NULL,
  DATA_PAGAMENTO DATE NOT NULL 
);*/

/*CREATE INDEX INDEX_NOME_CLIENTE
ON CLIENTES(NOME_CLIENTE)*/


INSERT INTO CLIENTES VALUES('81399237020','ANA BEATRIZ','AVENIDA GENIVAL DOS REIS,97',9632222310,'ANA.BEATRIZ@GMAIL.COM',NULL)
INSERT INTO VENDAS VALUES(700,10791631079,150,'CART�O(D�BITO)');
INSERT INTO PRODUTO VALUES(420,'MESA DE 6 CADEIRAS','M�VEL','MESA DE JANTAR PARA 6 PESSOAS. MEDIDAS:(1,50M DE COMPRIMENTO, E 1M DE ALTURA )',40,4500)
INSERT INTO ITENS_VENDA VALUES(1,100,100,19)
INSERT INTO SETOR VALUES(6,'MARKETING','RESPONS�VEL POR REALIZAR GEST�O DE REDES SOCIAS, CAMPANHAS DE PRODUTOS E OFERTAS,CAMPANHAS DE MARKETING',39)
INSERT INTO FORNECEDOR VALUES(6,'RICARDO GOMES - FORNECEDOR DE ELETR�NICOS','1737933983','RUA VICTOR DON BELLO ,59')
INSERT INTO FUNCIONARIOS VALUES(9,'AM�LIA DOS ANJOS','AUXILIAR DE LIMPEZA', 1680.00,'8 HORAS(DAS 10H �S 18H)',3)
INSERT INTO AQUISI��O VALUES(3,'GELADEIRA,IMPRESSORA',5,26,72800.00,'2025-06-02')

--HAVING
SELECT COUNT(VND.CLIENTE_COMPRADOR) AS QTTD_CLIENTES
FROM VENDAS VND
GROUP BY VND.CLIENTE_COMPRADOR
HAVING COUNT(VND.CLIENTE_COMPRADOR) > 0

SELECT COUNT(F.ID_FUNC) AS QUANTIDADE_DE_FUNCIONARIOS,F.SETOR
FROM FUNCIONARIOS F
GROUP BY F.SETOR
HAVING COUNT(F.SETOR) >= 1

--FUN��O DE AGREGA��O(SUM)
SELECT VENDAS.ID_VENDA,
   COUNT(VENDAS.PRODUTO_VENDIDO) AS QTDD_VENDAS_DE_UM_PRODUTO,
   MIN(VENDAS.ID_VENDA) AS MENOR_ID
FROM VENDAS AS VENDAS
GROUP BY VENDAS.PRODUTO_VENDIDO,VENDAS.ID_VENDA
ORDER BY VENDAS.PRODUTO_VENDIDO

--SELECT
SELECT * FROM AQUISI��O
SELECT * FROM CLIENTES 
SELECT * FROM VENDAS
SELECT * FROM ITENS_VENDA
SELECT * FROM  SETOR
SELECT * FROM FORNECEDOR
SELECT * FROM FUNCIONARIOS
SELECT * FROM PRODUTO


-----------------JOINS 
SELECT CLI.[CPF],CLI.[NOME_CLIENTE],CLI.[EMAIL],VND.[PRODUTO_VENDIDO],VND.[PAGAMENTO]
FROM CLIENTES AS CLI
LEFT JOIN VENDAS AS VND
ON VND.[CLIENTE_COMPRADOR] = CLI.[CPF]
--WHERE YEAR(CLI.DATA_CADASTRO) = 2020
--ORDER BY CLI.[NOME_CLIENTE]

SELECT FUNC.NOME_FUNC,FUNC.CARGO,STO.NOME_SETOR,STO.DESCRI��O,STO.NUMERO_FUNCIONARIOS
FROM FUNCIONARIOS AS FUNC
INNER JOIN SETOR AS STO
ON FUNC.SETOR = STO.ID_SETOR

SELECT VND.ID_VENDA,VND.CLIENTE_COMPRADOR,PRD.NOME_PRODUTO,PRD.DESCRI��O ,PRD.ID_PRODUTO
FROM VENDAS AS VND
RIGHT JOIN PRODUTO AS PRD
ON PRD.ID_PRODUTO = VND.PRODUTO_VENDIDO

SELECT CLI.CPF,CLI.EMAIL,CLI.NOME_CLIENTE, VND.PRODUTO_VENDIDO
FROM CLIENTES AS CLI
FULL  JOIN VENDAS AS VND
ON VND.CLIENTE_COMPRADOR = CLI.CPF
ORDER BY CLI.NOME_CLIENTE
--------------------


--UNION
SELECT ID_VENDA FROM VENDAS
UNION ALL
SELECT ID_VENDA FROM ITENS_VENDA
ORDER BY ID_VENDA


--AGREG
SELECT VND.ID_VENDA,PRODUTO_VENDIDO,PROD.NOME_PRODUTO,ITN.QUANTIDADE_VENDIDA,
	COUNT(VND.CLIENTE_COMPRADOR) AS QTTD_COMPRADORES,
	MAX(ITN.QUANTIDADE_VENDIDA) AS MAIOR_VALOR_PAGO,
	SUM(PROD.PRE�O) AS SOMA_DE_TODOS_OS_PRECOS,
	AVG(PROD.PRE�O) AS MEDIA_PRE�OS

FROM VENDAS VND,PRODUTO PROD,ITENS_VENDA ITN
WHERE VND.PRODUTO_VENDIDO = PROD.ID_PRODUTO
GROUP BY VND.ID_VENDA,VND.PRODUTO_VENDIDO,PROD.NOME_PRODUTO,ITN.QUANTIDADE_VENDIDA
ORDER BY VND.ID_VENDA DESC

SELECT ID_PRODUTO,NOME_PRODUTO,QUANTIDADE FROM PRODUTO

--INDEX PARA NOMES DE FUNCION�RIOS
--CREATE INDEX nome_funcs
--ON FUNCIONARIOS(NOME_FUNC);

--INDEX PARA O CPF DE CLIENTES
/*CREATE NONCLUSTERED INDEX cpf_client
ON CLIENTES(CPF)*/

--INDEX PARA NOME DE PRODUTOS
/*CREATE NONCLUSTERED INDEX nome_produto
ON PRODUTO(NOME_PRODUTO)*/


----SUBQUERY
SELECT * FROM PRODUTO
WHERE QUANTIDADE >= (
	SELECT AVG(QUANTIDADE)
	FROM PRODUTO
)
ORDER BY QUANTIDADE;


ALTER TABLE CLIENTES
ADD  IDADE INTEGER CHECK(IDADE>=18)

UPDATE CLIENTES 
SET IDADE = 50
WHERE CPF = '23074416033' AND  CPF='97562721041'
SELECT * FROM CLIENTES