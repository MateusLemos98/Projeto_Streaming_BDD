
USE STREAMING_DATABASE;
GO

--1. Visualizar todos os dados e colunas de cada uma das tabelas;
SELECT * FROM DBO.ASSINATURA;

SELECT * FROM DBO.CLIENTE;

SELECT * FROM DBO.CONTEUDO;

SELECT * FROM DBO.ENDERECO;

SELECT * FROM DBO.FUNCIONARIO;

SELECT * FROM DBO.PAGAMENTO;

SELECT * FROM DBO.RESIDENCIA;

SELECT * FROM DBO.SERVICO;

SELECT * FROM DBO.TELEFONE;

--2. Contar quantos registros tem em cada tabela;
SELECT COUNT(*) FROM DBO.ASSINATURA;

SELECT COUNT(*) FROM DBO.CLIENTE;

SELECT COUNT(*) FROM DBO.CONTEUDO;

SELECT COUNT(*) FROM DBO.ENDERECO;

SELECT COUNT(*) FROM DBO.FUNCIONARIO;

SELECT COUNT(*) FROM DBO.PAGAMENTO;

SELECT COUNT(*) FROM DBO.RESIDENCIA;

SELECT COUNT(*) FROM DBO.SERVICO;

SELECT COUNT(*) FROM DBO.TELEFONE;

--3. Informar quantos valores distintos existem para a tabela funcionario na coluna TELEFONE
SELECT COUNT(T.QTD) QTD_APENAS1 FROM (
	SELECT TELEFONE, COUNT(*) QTD FROM FUNCIONARIO GROUP BY TELEFONE
) AS T

--4. Listar os 5 funcionarios de maior salario;
SELECT TOP 5 * FROM FUNCIONARIO ORDER BY SALARIO DESC;

--5. Listar os 5 funcionarios de menor salario;
SELECT TOP 5 * FROM FUNCIONARIO ORDER BY SALARIO ASC;

--6. Listar os funcionários ordenados pelo nome;
SELECT * FROM FUNCIONARIO ORDER BY NOME ASC;

--7.  Selecionar quais valores distintos existem para a tabela cliente na coluna genero;
SELECT DISTINCT GENERO FROM CLIENTE; 

--8. Selecionar quais valores distintos existem para a tabela conteudo na coluna tipo;
SELECT DISTINCT TIPO FROM CONTEUDO;
