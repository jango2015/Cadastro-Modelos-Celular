-- Table: modelos
--DROP TABLE modelos;

CREATE TABLE modelos
(
  id serial NOT NULL,
  nome text,
  descricao text,
  CONSTRAINT modelos_pkey PRIMARY KEY (id)
)

