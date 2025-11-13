CREATE TABLE PEDIDO (
    id_pedido UUID PRIMARY KEY DEFAULT uuid(),
    numero_pedido INT NOT NULL,
    id_cliente UUID NOT NULL,
    data_prev_faturamento DATE,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(50),
    observacoes_pedido TEXT,
    
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT uk_numero_pedido UNIQUE (numero_pedido)
);

-- Indices
CREATE INDEX idx_pedido_numero ON PEDIDO(numero_pedido);
CREATE INDEX idx_pedido_cliente ON PEDIDO(id_cliente);
CREATE INDEX idx_pedido_data_prev ON PEDIDO(data_prev_faturamento);
CREATE INDEX idx_pedido_data_criacao ON PEDIDO(data_criacao);

ALTER TABLE PEDIDO COMMENT = 'Tabela de pedidos dos clientes';
ALTER TABLE PEDIDO MODIFY COLUMN id_pedido UUID COMMENT 'Código único para identificar o pedido';
ALTER TABLE PEDIDO MODIFY COLUMN numero_pedido INT COMMENT 'Número do pedido (único)';
ALTER TABLE PEDIDO MODIFY COLUMN data_prev_faturamento DATE COMMENT 'Data prevista para faturamento';
ALTER TABLE PEDIDO MODIFY COLUMN data_criacao DATETIME COMMENT 'Data de criação do pedido';
ALTER TABLE PEDIDO MODIFY COLUMN status_pedido VARCHAR(50) COMMENT 'Status atual do pedido';
ALTER TABLE PEDIDO MODIFY COLUMN observacoes_pedido TEXT COMMENT 'Observações gerais do pedido';