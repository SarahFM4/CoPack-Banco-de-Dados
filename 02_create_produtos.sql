CREATE TABLE PRODUTO (
    id_produto UUID PRIMARY KEY DEFAULT uuid(),
    codigo_produto VARCHAR(20) NOT NULL,
    descricao_completa TEXT,
    familia_produto VARCHAR(50),
    capacidade_ml INT,
    id_materia_prima UUID,
    personalizado BOOLEAN DEFAULT FALSE,
    
    FOREIGN KEY (id_materia_prima) REFERENCES MATERIA_PRIMA(id_materia_prima),
    CONSTRAINT uk_codigo_produto UNIQUE (codigo_produto)
);

-- Indices
CREATE INDEX idx_produto_codigo ON PRODUTO(codigo_produto);
CREATE INDEX idx_produto_familia ON PRODUTO(familia_produto);
CREATE INDEX idx_produto_mp ON PRODUTO(id_materia_prima);

ALTER TABLE PRODUTO COMMENT = 'Tabela de produtos disponíveis';
ALTER TABLE PRODUTO MODIFY COLUMN id_produto UUID COMMENT 'Código único para identificar o produto';
ALTER TABLE PRODUTO MODIFY COLUMN codigo_produto VARCHAR(20) COMMENT 'Código do produto Ex: PCP100W, PDBJ05EC';
ALTER TABLE PRODUTO MODIFY COLUMN descricao_completa TEXT COMMENT 'Descrição completa do produto';
ALTER TABLE PRODUTO MODIFY COLUMN familia_produto VARCHAR(50) COMMENT 'Família do produto Ex: BANDEJA, COPO, DIVISÓRIA';
ALTER TABLE PRODUTO MODIFY COLUMN capacidade_ml INT COMMENT 'Capacidade em ml Ex: 100 ml, 200 ml';
ALTER TABLE PRODUTO MODIFY COLUMN personalizado BOOLEAN COMMENT 'Se é ou não personalizado';