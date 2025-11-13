CREATE TABLE CLIENTE (
    id_cliente UUID PRIMARY KEY DEFAULT uuid(),
    razao_social VARCHAR(255) NOT NULL,
    cpnj_cpf VARCHAR(20),
    tipo_pessoa VARCHAR(10) NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    -- Limites
    CONSTRAINT chk_tipo_pessoa CHECK (tipo_pessoa IN ('Jurídica', 'Física')),
    CONSTRAINT uk_cnpj_cpf UNIQUE (cpnj_cpf)
);

-- Indices pra facilitar
CREATE INDEX idx_cliente_razao_social ON CLIENTE(razao_social);
CREATE INDEX idx_cliente_cnpj_cpf ON CLIENTE(cpnj_cpf);
CREATE INDEX idx_cliente_tipo_pessoa ON CLIENTE(tipo_pessoa);
CREATE INDEX idx_cliente_data_cadastro ON CLIENTE(data_cadastro);

ALTER TABLE CLIENTE COMMENT = 'Tabela de cadastro de clientes - informações empresariais e pessoais';
ALTER TABLE CLIENTE MODIFY COLUMN id_cliente UUID COMMENT 'Código único para identificar o cliente (Chave Primária)';
ALTER TABLE CLIENTE MODIFY COLUMN razao_social VARCHAR(255) COMMENT 'Nome da empresa/cliente (Razão Social ou Nome Completo)';
ALTER TABLE CLIENTE MODIFY COLUMN cpnj_cpf VARCHAR(20) COMMENT 'CNPJ ou CPF extraído quando possível - Campo único';
ALTER TABLE CLIENTE MODIFY COLUMN tipo_pessoa VARCHAR(10) COMMENT 'Tipo de pessoa: Jurídica ou Física';
ALTER TABLE CLIENTE MODIFY COLUMN data_cadastro DATETIME COMMENT 'Data e hora do cadastro do cliente';