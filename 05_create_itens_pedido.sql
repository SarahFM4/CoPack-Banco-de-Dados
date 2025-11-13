CREATE TABLE ITEM_PEDIDO (
    id_item_pedido UUID PRIMARY KEY DEFAULT uuid(),
    id_pedido UUID NOT NULL,
    id_produto UUID NOT NULL,
    quantidade INT NOT NULL,
    quantidade_prod INT,
    espfc_personalizacao TEXT,
    observacoes_produto TEXT,
    status_prod VARCHAR(50),
    data_inicio_prod DATE,
    data_fim_prod DATE,
    disponibilidade VARCHAR(50),
    
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- Indices
CREATE INDEX idx_item_pedido_pedido ON ITEM_PEDIDO(id_pedido);
CREATE INDEX idx_item_pedido_produto ON ITEM_PEDIDO(id_produto);
CREATE INDEX idx_item_pedido_status ON ITEM_PEDIDO(status_prod);

ALTER TABLE ITEM_PEDIDO COMMENT = 'Tabela de itens dos pedidos';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN id_item_pedido UUID COMMENT 'Código único para identificar o item do pedido';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN quantidade INT COMMENT 'Quantidade do produto no pedido';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN quantidade_prod INT COMMENT 'Quantidade produzida';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN espfc_personalizacao TEXT COMMENT 'Especificações de personalização';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN observacoes_produto TEXT COMMENT 'Observações específicas do produto';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN status_prod VARCHAR(50) COMMENT 'Status de produção do item';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN data_inicio_prod DATE COMMENT 'Data de início da produção';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN data_fim_prod DATE COMMENT 'Data de fim da produção';
ALTER TABLE ITEM_PEDIDO MODIFY COLUMN disponibilidade VARCHAR(50) COMMENT 'Disponibilidade do produto';