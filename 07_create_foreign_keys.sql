-- Adicionar foreign keys para a tabela PRODUTO
ALTER TABLE PRODUTO 
ADD CONSTRAINT fk_produto_materia_prima 
FOREIGN KEY (id_materia_prima) 
REFERENCES MATERIA_PRIMA(id_materiaprima);

-- Adicionar foreign keys para a tabela PEDIDO
ALTER TABLE PEDIDO 
ADD CONSTRAINT fk_pedido_cliente 
FOREIGN KEY (id_cliente) 
REFERENCES CLIENTE(id_cliente);

-- Adicionar foreign keys para a tabela ITEM_PEDIDO
ALTER TABLE ITEM_PEDIDO 
ADD CONSTRAINT fk_item_pedido_pedido 
FOREIGN KEY (id_pedido) 
REFERENCES PEDIDO(id_pedido);

ALTER TABLE ITEM_PEDIDO 
ADD CONSTRAINT fk_item_pedido_produto 
FOREIGN KEY (id_produto) 
REFERENCES PRODUTO(id_produto);

-- Adicionar limites de verificação
ALTER TABLE CLIENTE 
ADD CONSTRAINT chk_tipo_pessoa 
CHECK (tipo_pessoa IN ('Jurídica', 'Física'));

ALTER TABLE PRODUTO 
ADD CONSTRAINT chk_personalizado 
CHECK (personalizado IN (0, 1));

ALTER TABLE PEDIDO 
ADD CONSTRAINT chk_datas 
CHECK (data_prev_faturamento >= data_criacao);

ALTER TABLE ITEM_PEDIDO 
ADD CONSTRAINT chk_datas_producao 
CHECK (data_fim_prod >= data_inicio_prod);
