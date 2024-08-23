Create database Livraria;
use Livraria;
create TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
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

