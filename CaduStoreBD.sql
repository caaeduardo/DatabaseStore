 --Passo 1: Configuração do Banco de Dados e Tabelas 

-- CREATE
CREATE DATABASE CaduStoreBD;
GO

--DATABASE
USE CaduStoreBD;

-- TABELA
CREATE TABLE Categoria (
    CategoriaID int identity primary key,
    NomeCategoria varchar(50) NOT NULL
);


CREATE TABLE Loja (
    LojaID int identity primary key,
    NomeLoja varchar(100) NOT NULL,
    Endereco varchar(200)
);


CREATE TABLE Produtos (
    ProdutoID int identity primary key,
    NomeProduto varchar(100) NOT NULL,
    Preco decimal (10,2) NOT NULL,
    CategoriaID int foreign key references Categoria(CategoriaID)
);


CREATE TABLE Cliente (
    ClienteID int identity primary key,
    Nome varchar(100) NOT NULL,
    Email varchar(100),
    Telefone varchar(20)
);
-- DROP
	drop database CaduStore




 -- Passo 2: Inserção de Dados 
 
 INSERT INTO Categoria (NomeCategoria) VALUES
    ('Bones'),
    ('Sneakers'),
    ('Meias'),
    ('T-Shirt'),
	('Camisa de Time'),
    ('Shorts');

 INSERT INTO Loja (NomeLoja, Endereco) VALUES
	('Cadz Tatuapé', 'Rua Horizonte Ivo'),
	('Cadz Barra Funda', 'Rua Governador Carlos Eduardo'),
	('Cadz Morumbi', 'Rua da Morte'),
	('Cadz Mooca', 'Rua Pato Branco'),
	('Cadz Vila Mariana', 'Rua Zion Maykovski'),
	('Cadz Tucuruvi', 'Rua Diamante Rosa');

 INSERT INTO Produtos(NomeProduto, Preco, CategoriaID) VALUES
    ('59FIFTY Branded Core Essentials Style', 299.00, 1),
    ('NIKE x OFF-WHITE - Dunk Low "University Red"', 7530.00, 2),
    ('Meia Stance Icon Branca - ÚNICO', 50.00, 3),
    ('Camiseta - COMP BUTTERFLY', 99.99, 4),
    ('Camisa Palmeiras Puma II 24/25 Estádio ', 85.00, 5);

 INSERT INTO Cliente (Nome, Email, Telefone) VALUES
    ('Matheus Pereira', 'matheuspereira@gmail.com', '11987654321'),
    ('Pedro Guilherme', 'P9@email.com', '21987654321'),
    ('Estevão William', 'estevaozin41@email.com', '12345678901');


-- Passo 3: Comandos de Seleção e Joins 

SELECT p.NomeProduto, c.NomeCategoria
FROM Produtos p
INNER JOIN Categoria c ON p.CategoriaID = c.CategoriaID;

SELECT NomeLoja, Endereco FROM Loja;

-- Buscar c/ Inner Join um determinado produto Where "NomeCategoria"
SELECT p.NomeProduto
FROM Produtos p
INNER JOIN Categoria c ON p.CategoriaID = c.CategoriaID
WHERE c.NomeCategoria = 'Bones';


--Buscar todas Tabelas
SELECT * from Categoria
SELECT * from Loja
SELECT * from Cliente
SELECT * from Produtos


 

-- Passo 4: Comandos de Atualização 
/*	
	<body>
	<h1>
		DIFICULDADE ENCONTRADA;
	<h1/>
	<p>
		Como eu atualizo somente em um produto sendo que nunca da <strong>LINHAS AFETADAS<strong/>.<br>
		}
			Encontrei a solução.
		{
	<p/>
	<body/>
	*/

UPDATE Produtos
SET Preco = 120.00
WHERE NomeProduto = 'Camisa Palmeiras Puma II 24/25 Estádio ';

UPDATE Loja
SET Endereco = 'Avenida Estopim, 1000'
WHERE NomeLoja = 'Cadz Morumbi';

UPDATE Categoria
SET NomeCategoria = 'Bermuda'
WHERE NomeCategoria = 'Shorts';


-- Passo 5: Comandos de Exclusão
 
 
DELETE FROM Produtos
WHERE NomeProduto = 'Camisa Palmeiras Puma II 24/25 Estádio ';

DELETE FROM Cliente
WHERE Nome = 'Pedro Guilherme';

-- Passo 6: Alteração da Estrutura da Tabela 

alter table Produtos
add QuantidadeEstoque int default 0; -- Dessa forma eu defino a quantidade inicial do estoque como 0

alter table Cliente
add DataCadastro date default getdate(); -- Dessa forma eu defino a data de cadastro como a data atual, pois o getdate pega a data de hoje(atual)

/*	
	<body>
	<h1>
		DIFICULDADE ENCONTRADA;
	<h1/>
	<p>
		1.Questionar o Cozatti se posso usar <strong>*/GETDATE/*<strong/> em todas ocasiões correlacionada a date. 
		2.Porque não consigo criar a*/QuantidadeEstoque/* ???
	<p/>
	<body/>
*/


-- Passo 7: Chaves Estrangeiras e Relacionamentos 

CREATE TABLE Pedidos (
    PedidoID int identity primary key,
    ClienteID int foreign key references Cliente(ClienteID),
    ProdutoID int foreign key references Produtos(ProdutoID),
    Quantidade int
);

INSERT INTO Pedidos (ClienteID, ProdutoID, Quantidade) VALUES
    (1, 5, 5), 
    (2, 2, 1), 
    (3, 3, 3);

SELECT p.PedidoID, c.Nome AS Cliente, pr.NomeProduto, p.Quantidade
FROM Pedidos p
INNER JOIN Cliente c ON p.ClienteID = c.ClienteID
INNER JOIN Produtos pr ON p.ProdutoID = pr.ProdutoID;


-- Passo 8: Consultas e Alterações Avançadas 

alter table Pedidos
alter column Quantidade int; 

