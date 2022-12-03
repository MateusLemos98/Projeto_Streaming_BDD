CREATE DATABASE STREAMING_DATABASE;

USE STREAMING_DATABASE;
GO

--DROP TABLE CONTEUDO;

CREATE TABLE CONTEUDO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	TIPO VARCHAR(25) NOT NULL,
	CATEGORIA VARCHAR(25),
	DESCRICAO VARCHAR(250),
	ANO VARCHAR(25),
	CONSTRAINT PK_CONTEUDO PRIMARY KEY(ID)
);
GO

--DROP TABLE RESIDENCIA;

CREATE TABLE RESIDENCIA(
	ID INT IDENTITY(1,1) NOT NULL,
	DESCRICAO VARCHAR(50),
	CONSTRAINT PK_RESIDENCIA PRIMARY KEY(ID)
);
GO

--DROP TABLE ENDERECO;

CREATE TABLE ENDERECO(
	ID INT IDENTITY(1,1) NOT NULL,
	RUA VARCHAR(250),
	BAIRRO VARCHAR(50),
	NUMERO INT,
	CEP INT,
	CIDADE VARCHAR(50),
	ESTADO VARCHAR(50),
	PAIS VARCHAR(250),
	COMPLEMENTO VARCHAR(50),
	ID_RESIDENCIA INT,
	CONSTRAINT PK_ENDERECO PRIMARY KEY(ID),
	CONSTRAINT FK_ENDERECO_RESIDENCIA FOREIGN KEY (ID_RESIDENCIA)
	REFERENCES DBO.RESIDENCIA(ID),
);
GO

--DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR (50) NOT NULL,
	GENERO CHAR (1),
	EMAIL VARCHAR(50),
	ID_ENDERECO INT,
	CONSTRAINT PK_CLIENTE PRIMARY KEY(ID),
	CONSTRAINT FK_CLIENTE_ENDERECO FOREIGN KEY (ID_ENDERECO)
	REFERENCES DBO.ENDERECO(ID),
);
GO

--DROP TABLE FUNCIONARIO;

CREATE TABLE FUNCIONARIO(
	ID INT IDENTITY(1,1) NOT NULL,
	NOME VARCHAR (100) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	GENERO CHAR (1),
	SALARIO DECIMAL(6,2),
	ID_ENDERECO_FUNCIONARIO INT,
	TELEFONE VARCHAR(11),
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(ID),
	CONSTRAINT FK_FUNCIONARIO_ENDERECO FOREIGN KEY (ID_ENDERECO_FUNCIONARIO)
	REFERENCES DBO.ENDERECO(ID),	
);
GO

--DROP TABLE TELEFONE;

	CREATE TABLE TELEFONE(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_CLIENTE INT,
	ID_FUNCIONARIO INT,
	TELEFONES VARCHAR(11),
	CONSTRAINT PK_TELEFONE PRIMARY KEY (ID),
	CONSTRAINT FK_TELEFONE_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE(ID),
	CONSTRAINT FK_TELEFONE_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO(ID),
	);
	GO

	--DROP TABLE PAGAMENTO;

	CREATE TABLE PAGAMENTO(
		ID INT IDENTITY(1,1) NOT NULL,
		DESCRICAO VARCHAR(30) NOT NULL,
		CONSTRAINT PK_PAGAMENTO PRIMARY KEY (ID)
	);
	GO

	--DROP TABLE SERVICO;

	CREATE TABLE SERVICO(
	ID INT IDENTITY(1,1) NOT NULL,
	ID_PAGAMENTO INT,
	ID_CLIENTE INT,
	ID_FUNCIONARIO INT,
	CONSTRAINT PK_SERVICO PRIMARY KEY (ID),
	CONSTRAINT FK_SERVICO_PAGAMENTO FOREIGN KEY (ID_PAGAMENTO)
	REFERENCES DBO.PAGAMENTO(ID),
	CONSTRAINT FK_SERVICO_CLIENTE FOREIGN KEY (ID_CLIENTE)
	REFERENCES DBO.CLIENTE(ID),	
	CONSTRAINT FK_SERVICO_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO)
	REFERENCES DBO.FUNCIONARIO(ID),	
	);
	GO

	--DROP TABLE ASSINATURA;

	CREATE TABLE ASSINATURA(
		ID INT IDENTITY(1,1) NOT NULL,
		ID_CONTEUDO INT NOT NULL,
		ID_SERVICO INT NOT NULL,
		CONSTRAINT PK_ASSINATURA PRIMARY KEY (ID),
		CONSTRAINT FK_ASSINATURA_CONTEUDO FOREIGN KEY (ID_CONTEUDO)
		REFERENCES DBO.CONTEUDO(ID),
		CONSTRAINT FK_ASSINATURA_SERVICO FOREIGN KEY (ID_SERVICO)
		REFERENCES DBO.SERVICO(ID),	
	);
	GO












