set search_path = "osaka";

-- Criando tabela sensores
create table sensores (
    id serial primary key,
    nome_sensor varchar(100) not null,
    tipo_sensor varchar(50) not null,  --
    localizacao varchar(100) not null,
    ativo boolean default true,
    data_instalacao timestamptz default now(),
    ultimo_status varchar(50) default 'normal'
);

-- Criando tabela de leituras de sensores
create table leituras_sensor (
    id serial,
    sensor_id int not null,
    valor decimal(10, 2) not null,  -- Valor da medição
    data_leitura timestamptz default now(),
    unidade varchar(10),  -- Unidade de medida
    primary key (sensor_id, data_leitura),
    foreign key (sensor_id) references sensores(id)
);

-- Criando leituras_sensor em uma hypertable
select create_hypertable('leituras_sensor', 'data_leitura');

-- Criando tabela de manutenção dos sensores
create table manutencao_sensor (
    id serial,
    sensor_id int not null,
    data_manutencao timestamptz default now(),
    tipo_manutencao varchar(100) not null,
    descricao text,
    foreign key (sensor_id) references sensores(id),
    primary key (sensor_id, data_manutencao)
);

-- Transformando manutencao_sensor em uma hypertable
select create_hypertable('manutencao_sensor', 'data_manutencao');

-- Criando tabela de alertas gerados pelos sensores
create table alertas_sensor (
    id serial,
    sensor_id int not null,
    data_alerta timestamptz default now(),
    tipo_alerta varchar(100) not null,
    descricao text,
    status_alerta varchar(20) default 'pendente',
    foreign key (sensor_id) references sensores(id),
    primary key (sensor_id, data_alerta)
);

-- Transformando alertas_sensor em uma hypertable
select create_hypertable('alertas_sensor', 'data_alerta');




select * from sensores;

select * from leituras_sensor;

select * from manutencao_sensor;

select * from alertas_sensor;


