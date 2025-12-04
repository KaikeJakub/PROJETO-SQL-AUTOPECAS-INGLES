--DDL (Data Definition Language)/(Linguagem de Definição de Dados)
-- CREATE, ALTER AND DROP
-- CRIACAO, ALTERACAO E EXCLUSAO

-- Criaçâo do banco autopeças
CREATE DATABASE AUTOPARTS;

-- Excluir o banco DROP DATABASE AUTOPARTS

--CREATE DATABASE AUTOPARTS;
USE AUTOPARTS;
-- Criaçâo da tabela clientes
CREATE TABLE CUSTOMER
(
                   -- Chave primaria
 ID_CUSTOMER INT IDENTITY(1,1) PRIMARY KEY,-- Codigo unico do cliente
 C_NAME VARCHAR(100), -- Nome cliente
 DOCUMENT VARCHAR(20), -- Cpf cliente
 PHONE VARCHAR(60), -- Numero cliente
 DATE_BIRTH DATE,-- Data de aniversario clinte
  SEX CHAR(1) CHECK (SEX IN ('M','F')), -- Sexo cliente
 CHECK (SEX IN ('M','F')), -- Opcional: valida M ou F
 CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP -- Data do cadastro cliente
);

ALTER TABLE CUSTOMER ADD [EMAIL_C] varchar(30);
ALTER TABLE CUSTOMER ADD [DROP_C] varchar(100);
ALTER TABLE CUSTOMER DROP COLUMN DROP_C;





-- Tabela endereço clientes
CREATE TABLE C_ADDRESS
(
                         -- Chave primaria
 ID_ADDRESS INT IDENTITY(1,1) PRIMARY KEY, -- Codigo endereco cliente
 ID_CUSTOMER INT,-- Codigo cliente
 ZIP_CODE INT NULL, -- Cep cliente
 CODE_HOUSE INT,-- Numero da casa cliente
 CITY VARCHAR(60),-- Cidade cliente
 C_STATE CHAR(2), -- Estado cliente
 REGISTRATION_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data do registro
 -- Chave extrangeira
 FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER(ID_CUSTOMER)
);

--Tabela vendedor
CREATE TABLE SELLER (
 ID_SELLER INT IDENTITY(1,1) PRIMARY KEY, --Codigo unico do vendedor
 NAME_SELLER VARCHAR(100) NOT NULL, -- Nome vendedor
 PHONE VARCHAR(20), -- Numero vendedor
 SEX CHAR(1) CHECK (SEX IN ('M','F')), -- Sexo vendedor
 TYPE_SELLER CHAR(1), -- Tipo de vendedor
 EMAIL VARCHAR(100), -- Email
 DATE_BIRTH DATE,-- Data de aniversario
 STATUS_SELLER CHAR(1), -- Status do vendedor
 DOCUMENT VARCHAR(20), -- CPF vendedor
 CREATED_AT DATETIME DEFAULT CURRENT_TIMESTAMP -- Data do registro

);


-- Tabela Categoria
CREATE TABLE CATEGORY (
 ID_CATEGORY INT IDENTITY(1,1) PRIMARY KEY, -- Codigo unico da categoria
 NAME_CATEGORY VARCHAR(100) NOT NULL, -- Nome categoria
 STATUS CHAR(1) -- Status categoria
);

-- Tabela Produtos
CREATE TABLE PRODUCTS
(
                      -- Chave primaria
 ID_PRODUCTS INT IDENTITY(1,1) PRIMARY KEY,-- Codigo unico do produto
 ID_CATEGORY INT, -- Codigo unico da categoria
 NAME_PRODUCTS VARCHAR(100), -- Nome produto
 HEIGHT_PRODUCTS DECIMAL(4,2),-- Altura produto
 WIDTH_PRODUCTS DECIMAL(4,2), -- Largura produto
 WEIGHT_PRODUCTS DECIMAL(6,2), -- Peso produto
 PRICE_PRODUCTS INT, -- Preco produto
 CATEGORY VARCHAR(50), -- categoria produto
 STOCK INT DEFAULT 0, -- Estoque produto
 STATUS CHAR(1), -- Status produto    
  -- Chave Extrangeira
 FOREIGN KEY (ID_CATEGORY) REFERENCES CATEGORY(ID_CATEGORY)
);


ALTER TABLE PRODUCTS  DROP COLUMN HEIGHT_PRODUCTS;
ALTER TABLE PRODUCTS  DROP COLUMN WIDTH_PRODUCTS ;
ALTER TABLE PRODUCTS  DROP COLUMN WEIGHT_PRODUCTS;


ALTER TABLE PRODUCTS ADD HEIGHT_PRODUCTS DECIMAL(6,2);
ALTER TABLE PRODUCTS ADD WIDTH_PRODUCTS DECIMAL(6,2);
ALTER TABLE PRODUCTS ADD WEIGHT_PRODUCTS DECIMAL(8,2);



-- Tabela Fornecedores
CREATE TABLE SUPPLIER 
(

 ID_SUPPLIER INT IDENTITY(1,1) PRIMARY KEY, -- Codigo unico do fornecedor
 ID_PRODUCTS INT,-- Codigo unico do produto
 NAME_SUPPLIER VARCHAR(100) NOT NULL, -- Nome do fornecedor
 PHONE VARCHAR(20), -- Numero do fornecedor
 EMAIL VARCHAR(100), -- Email forncedor
 CNPJ VARCHAR(18), -- Cnpj
 ADDRESS_SUP VARCHAR(150), -- Endereco fornecedor
 STATUS CHAR(1) -- Statud forncedor
  -- Chave Extrangeiras
 FOREIGN KEY (ID_PRODUCTS) REFERENCES PRODUCTS(ID_PRODUCTS)
);


--DROP TABLE SUPPLIER 

-- Tabela Pedidos
CREATE TABLE ORDERS 
(

 ID_ORDER INT IDENTITY(1,1) PRIMARY KEY, -- Codigo unico do pedido
 ID_CUSTOMER INT NOT NULL,  -- Codigo unico do cliente
 ID_SELLER INT,-- Codigo unico do vendedor
 ID_PRODUCTS INT, -- Codigo unico do produto 
 ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data do pedido
 NAME_PRODUCTS varchar(100), -- Nome do produto
 AMOUNT_PRODUCTS INT, -- Quantidade peças
 TOTAL DECIMAL(10,2), -- Total a pagar
 STATUS CHAR(2),-- Status do pedido
 -- Chave Extrangeira
 FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER(ID_CUSTOMER), 
 -- Chave Extrangeira
 FOREIGN KEY (ID_SELLER) REFERENCES SELLER(ID_SELLER) 
);

-- Tabela Pagamentos
CREATE TABLE PAYMENTS (
    ID_PAYMENT INT IDENTITY(1,1) PRIMARY KEY, -- Codigo unico do pagamento
    ID_ORDER INT NOT NULL, -- Codigo unico do pedido
    ID_CUSTOMER INT, -- Codigo unico cliente
    PAYMENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data do pagamento
    AMOUNT DECIMAL(10,2), -- Total do pagamento
    STATUS CHAR(2),-- Status pagamento
    -- Chave Extrangeira
    FOREIGN KEY (ID_ORDER) REFERENCES ORDERS(ID_ORDER), 
    FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER(ID_CUSTOMER)
);