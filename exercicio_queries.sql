-- Total de acidentes com vítima por bairro em acidentes com embriaguez;

select
    e.nome_bairro,
    count(o.numero_boletim) as numero_acidentes
    from ocorrencias_transito as o
    left join endereco as e on o.numero_boletim = e.numero_boletim
    left join pessoa_acidente as p on o.numero_boletim = p.numero_boletim
    where p.embreagues = 'SIM' and
    (o.desc_tipo_acidente like "%COM VITIMA%" or
    o.desc_tipo_acidente like "%C/ VITIMA%")
    group by e.nome_bairro;

-- Total de acidentes por tipo de pavimento e condição do tempo;

select 
    o.pavimento,
    o.desc_tempo,
    count(o.numero_boletim) as numero_acidentes
    from ocorrencias_transito as o
    group by o.pavimento, o.desc_tempo;


-- Total de pessoas acidentadas por tipo de veiculo e tipo de pavimentação;

select
    p.especie_veiculo,
    o.pavimento,
    sum(p.n_envolvido) as total_acidentes
    from pessoa_acidente as p
    join ocorrencias_transito as o on o.numero_boletim = p.numero_boletim
    group by p.especie_veiculo, o.pavimento;

-- Média de idade dos condutores por tipo de veículo e tipo de acidente;

select
    p.especie_veiculo,
    o.desc_tipo_acidente,
    avg(p.idade) as media_idade
    from pessoa_acidente as p
    join ocorrencias_transito as o on o.numero_boletim = p.numero_boletim
    group by p.especie_veiculo, o.desc_tipo_acidente;

-- Média de idade dos condutores por indicativo de embriaguez;

select
    p.embreagues,
    avg(p.idade) as media_idade
    from pessoa_acidente as p
    where p.embreagues in ('NAO','SIM')
    group by p.embreagues;
