CREATE TABLE MATERIA_PRIMA (
    id_materia_prima UUID PRIMARY KEY DEFAULT uuid(),
    tipo_papel VARCHAR(50),
    gramatura INT,
    formato_aberto VARCHAR(50),
    fibra VARCHAR(50),
    descricao TEXT
);

-- Indices
CREATE INDEX idx_mp_tipo_papel ON MATERIA_PRIMA(tipo_papel);
CREATE INDEX idx_mp_gramatura ON MATERIA_PRIMA(gramatura);

ALTER TABLE MATERIA_PRIMA COMMENT = 'Tabela de matérias-primas utilizadas na produção';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN id_materia_prima UUID COMMENT 'Código único para identificar a matéria-prima';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN tipo_papel VARCHAR(50) COMMENT 'Tipo de papel utilizado';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN gramatura INT COMMENT 'Gramatura do papel';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN formato_aberto VARCHAR(50) COMMENT 'Formato aberto do material';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN fibra VARCHAR(50) COMMENT 'Tipo de fibra do material';
ALTER TABLE MATERIA_PRIMA MODIFY COLUMN descricao TEXT COMMENT 'Descrição completa da matéria-prima';