Create database Livraria;
use Livraria;
drop database Livraria;
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    CPF VARCHAR(20),
    Sexo ENUM('masculino', 'feminino'),
    Data_Nascimento DATE,
    Senha INT,
    Dia_cadastrado DATE
    
);
CREATE TABLE Livros (
    LivroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(100),
    Editora VARCHAR(100),
    AnoPublicacao INT,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    Status VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
CREATE TABLE ItensPedido (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    LivroID INT,
    Quantidade INT NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

INSERT INTO Clientes (Nome, Endereco, Telefone, Email, CPF, Sexo, Data_Nascimento, Senha, Dia_cadastrado) VALUES
('João Silva', 'Rua A, 123', '(11) 98765-4321', 'joao.silva@email.com', '123.456.789-00', 'masculino', '1980-01-15', 123456, '2024-02-24'),
('Maria Oliveira', 'Avenida B, 456', '(21) 97654-3210', 'maria.oliveira@email.com', '234.567.890-01', 'feminino', '1990-05-23', 234567, '2024-02-28'),
('Pedro Santos', 'Praça C, 789', '(31) 96543-2109', 'pedro.santos@email.com', '345.678.901-02', 'masculino', '1985-08-30', 345678, '2024-04-03'),
('Ana Pereira', 'Rua D, 101', '(41) 95432-1098', 'ana.pereira@email.com', '456.789.012-03', 'feminino', '1992-03-14', 456789, '2024-05-10'),
('Carlos Souza', 'Avenida E, 202', '(51) 94321-0987', 'carlos.souza@email.com', '567.890.123-04', 'masculino', '1987-09-25', 567890, '2024-05-11'),
('Fernanda Lima', 'Rua F, 303', '(61) 93210-9876', 'fernanda.lima@email.com', '678.901.234-05', 'feminino', '1995-07-17', 678901, '2024-05-30'),
('Ricardo Costa', 'Praça G, 404', '(71) 92109-8765', 'ricardo.costa@email.com', '789.012.345-06', 'masculino', '1982-12-02', 789012, '2024-06-07'),
('Juliana Almeida', 'Rua H, 505', '(81) 91098-7654', 'juliana.almeida@email.com', '890.123.456-07', 'feminino', '1988-04-12', 890123, '2024-07-20'),
('Eduardo Martins', 'Avenida I, 606', '(91) 90987-6543', 'eduardo.martins@email.com', '901.234.567-08', 'masculino', '1979-11-20', 901234, '2024-07-25'),
('Tatiane Rocha', 'Rua J, 707', '(11) 89876-5432', 'tatiane.rocha@email.com', '012.345.678-09', 'feminino', '1991-06-29', 123456, '2024-08-10');

INSERT INTO Livros (Titulo, Autor, Editora, AnoPublicacao, Preco, Estoque) VALUES
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', 1943, 29.90, 50),
('Dom Casmurro', 'Machado de Assis', 'Editora Abril', 1899, 39.90, 30),
('1984', 'George Orwell', 'Companhia das Letras', 1949, 49.90, 40),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', 1997, 59.90, 20),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', 1954, 79.90, 15),
('A Revolução dos Bichos', 'George Orwell', 'Companhia das Letras', 1945, 29.90, 25),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', 1937, 49.90, 35),
('O Código Da Vinci', 'Dan Brown', 'Editora Record', 2003, 39.90, 45),
('A Menina que Roubava Livros', 'Markus Zusak', 'Editora Intrínseca', 2005, 34.90, 50),
('O Silêncio dos Inocentes', 'Thomas Harris', 'HarperCollins', 1988, 29.90, 30);

INSERT INTO Pedidos (ClienteID, DataPedido, Status) VALUES
(1, '2024-08-01', 'Concluído'),
(2, '2024-08-02', 'Pendente'),
(3, '2024-08-03', 'Cancelado'),
(4, '2024-08-04', 'Pendente'),
(5, '2024-08-05', 'Concluído'),
(6, '2024-08-06', 'Pendente'),
(7, '2024-08-07', 'Concluído'),
(8, '2024-08-08', 'Cancelado'),
(9, '2024-08-09', 'Concluído'),
(10, '2024-08-10', 'Pendente');

INSERT INTO ItensPedido (PedidoID, LivroID, Quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 4, 3),
(3, 5, 1),
(4, 6, 2),
(5, 7, 1),
(5, 8, 2),
(6, 9, 1),
(7, 10, 1);

		-- Listar os Usuarios cadastrados no Banco
SELECT * FROM clientes;

		-- Usuarios cadastrados no ultimo mês
SELECT COUNT(*) AS NumeroDeClientes
FROM Clientes
WHERE Dia_cadastrado >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

		-- Criar script restaurar informações de login de 1 usuário!

UPDATE Clientes
SET Nome = 'João Silva Ribeiro',
	Senha = 1234567
where ClienteID = 1;


		-- Criar script selecão de Livros cadastrados?
        
SELECT * FROM Livros;
        
        
		-- Criar script de livros emprestados por cliente?
        
SELECT c.Nome NomeCliente, l.Titulo TituloLivro, ip.Quantidade Quantidade
FROM Clientes c
JOIN Pedidos p ON c.ClienteID = p.ClienteID
JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
JOIN Livros l ON ip.LivroID = l.LivroID
WHERE c.ClienteID = 4;

        
        
		-- Elaborar 3 perguntas utilizando as clausulas: Distinct, Not , Top

 -- Quais as diferentes editoras dos livros cadastrados?
 
 SELECT DISTINCT Editora FROM Livros;
 
 -- Quais livros não são da editora Rocco
SELECT Titulo, Autor, Editora, AnoPublicacao, Preco
FROM Livros
WHERE Editora NOT LIKE 'Rocco';

-- Quais são os 3 livros mais caro?
SELECT TOP 3 Titulo, Preco
FROM Livros
ORDER BY Preco DESC;


