CREATE EXTERNAL TABLE IF NOT EXISTS ocorrencias_transito (
    numero_boletim String,
    data_hora_boletim String,
    data_hora_inclusao String,
    tipo_acidente String,
    desc_tipo_acidente String,
    cod_tempo Integer,
    desc_tempo String,
    cod_pavimento Integer,
    pavimento String,
    cod_regional Integer,
    desc_regional String,
    origem_boletim String,
    local_sinalizado String,
    valocidade_permitida Integer,
    coodernada String,
    hora_informada String,
    indicador_fatalidade String,
    valor_ups Integer,
    descricao_ups String,
    data_alteracao_smsa String,
    valor_ups_antiga Integer,
    descricao_ups_antiga String
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/tabelas/si-bol-2019.csv' INTO TABLE ocorrencias_transito;

CREATE EXTERNAL TABLE IF NOT EXISTS pessoa_acidente (
    numero_boletim String,
    data_hora_boletim String,
    n_envolvido Integer,
    condutor String,
    cod_severidade Integer,
    desc_severidade String,
    sexo String,
    cinto_seguranca String,
    embreagues String,
    idade Integer,
    nascimento String,
    categoria_habilitacao String,
    descricao_habilitacao String,
    declaracao_obito String,
    cod_severidade_antigo String,
    especie_veiculo String,
    pedestre String,
    passageiro String,
    veiculo String,
    nao_informado String,
    nao_informado_1 String
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/tabelas/si_env-2019.csv' INTO TABLE pessoa_acidente;


CREATE EXTERNAL TABLE IF NOT EXISTS endereco (
    numero_boletim String,
    data_hora_boletim String,
    n_municipio Integer,
    nome_municipio String,
    seq_logradouro Integer,
    n_logradouro String,
    tipo_logradouro String,
    nome_logradouro String,
    tipo_logradouro_anterior String,
    nome_logradouro_anterior String,
    n_bairro String,
    nome_bairro String,
    tipo_bairro String,
    descricao_tipo_bairro String,
    n_imovel String,
    n_imovel_proximo String
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

LOAD DATA INPATH '/user/tabelas/si-log-2019.csv' INTO TABLE endereco;

ALTER TABLE endereco SET TBLPROPERTIES ("skip.header.line.count"="1");
ALTER TABLE pessoa_acidente SET TBLPROPERTIES ("skip.header.line.count"="1");
ALTER TABLE ocorrencias_transito SET TBLPROPERTIES ("skip.header.line.count"="1");
