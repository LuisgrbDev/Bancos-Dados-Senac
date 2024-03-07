  CREATE DATABASE HOTEL;
  
 USE HOTEL;
 
CREATE TABLE IF NOT EXISTS cliente(
	codCliente INT PRIMARY KEY AUTO_INCREMENT,
    rgCliente VARCHAR (20) NOT NULL,
    enderecoCliente VARCHAR(50) NOT NULL,
    bairroCliente VARCHAR(25),
    estadoCliente VARCHAR(20) NOT NULL,
    CEPCliente VARCHAR(8) NOT NULL, 
    nascimentoCliente DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS telefone(
	telefone VARCHAR(30) PRIMARY KEY,
    codCliente INT,
	tipoTelefone VARCHAR(35) NOT NULL,
    FOREIGN KEY (codCliente) REFERENCES cliente (codCliente)
);

CREATE TABLE IF NOT EXISTS Chale (
	codChale INT PRIMARY KEY NOT NULL,
    localizacao VARCHAR(50),
    capacidade INT,
    valorAltaEstacao DECIMAL(10,2) ,
    valorBaixaEstacao DECIMAL (10,2) 
);

CREATE TABLE IF NOT EXISTS hospedagem(
	codHospedagem INT PRIMARY KEY AUTO_INCREMENT,
	codChale INT,
    codCliente INT,
	estado VARCHAR (30),
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    qtdPessoas INT NOT NULL,
    desconto INT,
    valorFinal DECIMAL(10,2),
    FOREIGN KEY (codChale) REFERENCES Chale (codChale),
    FOREIGN KEY (codCliente) REFERENCES cliente (codCliente)
);


CREATE TABLE IF NOT EXISTS item (
	nomeItem VARCHAR(100) PRIMARY KEY,
    descricaoItem VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS Chale_item(
	codChale INT,
    nomeItem VARCHAR(100),
    PRIMARY KEY (codChale,nomeITEM),
    FOREIGN KEY (codChale) REFERENCES chale (codChale),
    FOREIGN KEY (nomeItem) REFERENCES item (nomeItem)
);



CREATE TABLE IF NOT EXISTS servico(
	codServico INT PRIMARY KEY,
    nomeServico VARCHAR(50),
    ValorServico DECIMAL (10,2)
);


CREATE TABLE IF NOT EXISTS Hospedagem_Servico(
	codHospedagem INT,
    dataServico DATE NOT NULL,
    codServico INT,
    PRIMARY KEY (codHospedagem, codServico),
    FOREIGN KEY (codHospedagem) REFERENCES Hospedagem (codHospedagem),
    FOREIGN KEY (codServico) REFERENCES servico (codServico)
);




