-- Criação de tabela cliente
create table cliente(
    Id int identity
        primary key,
    Nome varchar (100) not null,
    Email varchar (100) not null,
    Telefone varchar (15),
    DataNascimento date,
    DataCadastro datetime,
    DataEditCad datetime,
    Active bit
)

-- Criação da tabela pedidos
create table pedidos(
    Id int identity
    primary key,
    ClientId int not null,
    DataPedido datetime,
    Cancelado bit,
    ValorTotal DECIMAL (10, 2) not null,
    MetodoPagamento varchar (50),
    FOREIGN KEY (ClientId) references cliente(ID)
)

create table produtos(
    Id int identity primary key,
    NomeProduto varchar (100) not null,
    Preco decimal (10, 2) not null,
    Estoque int not null
)

create table item_pedido(
    Id int identity primary key,
    PedidoId int not null,
    ProdutoId int not null,
    Quantidade int not null,
    PrecoUnitario decimal (10, 2) not null,
    FOREIGN KEY (PedidoId) references pedidos(Id),
    FOREIGN KEY (ProdutoId) references produtos(Id)
)




select * from cliente

insert cliente (Nome, Email, Telefone, DataNascimento, DataCadastro, DataEditCad, Active)
values ('PereraGXP', 'gabrielpereira0907@gmail.com', '(85)99214-1005', N'2003-07-09', getdate(), getdate(), 1)

select * from pedidos

insert pedidos (ClientId, DataPedido, Cancelado, ValorTotal, MetodoPagamento)
values (1, getdate(),0,150.00,'pix')

select * from produtos

insert produtos (NomeProduto, Preco, Estoque)
values ('Fonte',150.00,200)

insert produtos (NomeProduto, Preco, Estoque)
values ('Placa Mãe', 860.00,100)

select * from item_pedido

insert item_pedido (PedidoId, ProdutoId, Quantidade, PrecoUnitario)
values (2,1,1,150.00)

update produtos
set NomeProduto = 'Placa Mae ASRock B450M Steel Legend',
    Preco = 697.99
where Id = 2

update produtos
set NomeProduto = 'Fonte Gamer Rise Mode Zeus 500W',
    Preco = 219.99
where Id = 1

update pedidos
set ValorTotal = 219.99
where Id = 2


