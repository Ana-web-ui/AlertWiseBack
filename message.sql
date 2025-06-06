-- Sequencies
create sequence id_usuario;
create sequence id_publicacao;
create sequence id_comentario;
create sequence id_area_risco;
create sequence id_jogo;

-- Tables
create table usuario_gs (
   id    int primary key not null,
   nome  varchar(30) not null,
   email varchar(45) not null,
   senha varchar(60) not null
);

create table publicacao_gs (
   id              int primary key not null,
   conteudo        VARCHAR(150) not null,
   data_publicacao date not null,
   id_usuario      int
);

create table comentario_gs (
   id              int primary key not null,
   conteudo        varchar(90) not null,
   data_comentario date not null,
   id_usuario      int,
   id_publicacao   int
);

create table area_risco_gs (
   id         int primary key not null,
   endereco   varchar(50) not null,
   tipo_risco varchar(30) not null,
   data       date not null,
   id_usuario int
);

create table jogo_gs (
   id         int primary key not null,
   pontos     int not null,
   id_usuario int
);

-- Alters Table
alter table publicacao_gs
   add constraint fk_usuario_publicacao foreign key ( id_usuario )
      references usuario_gs ( id );

alter table comentario_gs
   add constraint fk_usuario_comentario foreign key ( id_usuario )
      references usuario_gs ( id );

alter table comentario_gs
   add constraint fk_publicacao_comentario foreign key ( id_publicacao )
      references publicacao_gs ( id );

alter table area_risco_gs
   add constraint fk_usuario_area_risco foreign key ( id_usuario )
      references usuario_gs ( id );

alter table jogo_gs
   add constraint fk_usuario_jogo foreign key ( id_usuario )
      references usuario_gs ( id );

-- Inserts
-- usuario_gs
insert into usuario_gs (id, nome, email, senha) values ( id_usuario.nextval, 'Ana', 'ana@gmail.com', '123' ); commit;
insert into usuario_gs (id, nome, email, senha) values ( id_usuario.nextval, 'Caio', 'caio@gmail.com', '123' ); commit;
insert into usuario_gs (id, nome, email, senha) values ( id_usuario.nextval, 'Kevyn', 'kevyn@gmail.com', '123' ); commit;
insert into usuario_gs (id, nome, email, senha) values ( id_usuario.nextval, 'Lucas', 'lucas@gmail.com', '123' ); commit;
insert into usuario_gs (id, nome, email, senha) values ( id_usuario.nextval, 'Genésio', 'genesio@gmail.com', '123' ); commit;

-- publicacao_gs
insert into publicacao_gs (id, conteudo, data_publicacao, id_usuario) values ( id_publicacao.nextval, 'O nível do rio Itajaí-Açu subiu 12 metros em 24h, deixando centenas de desabrigados. A Defesa Civil trabalha no resgate de famílias isoladas.', CURRENT_DATE, 1); commit;
insert into publicacao_gs (id, conteudo, data_publicacao, id_usuario) values ( id_publicacao.nextval, 'Terremoto de 6.7 graus atingiu o norte do Chile hoje de madrugada. Até o momento foram registrados danos em edificações antigas, mas sem vítimas fatais.', CURRENT_DATE, 2); commit;
insert into publicacao_gs (id, conteudo, data_publicacao, id_usuario) values ( id_publicacao.nextval, 'Furacão Maria segue em direção às Pequenas Antilhas com ventos de 220km/h. Autoridades locais já iniciaram evacuação de áreas costeiras.', CURRENT_DATE, 3); commit;
insert into publicacao_gs (id, conteudo, data_publicacao, id_usuario) values ( id_publicacao.nextval, '6º ano consecutivo de seca extrema no sertão da Bahia. Reservatórios estão com apenas 8% da capacidade e agricultores perderam toda a safra.', CURRENT_DATE, 4); commit;
insert into publicacao_gs (id, conteudo, data_publicacao, id_usuario) values ( id_publicacao.nextval, 'Incêndios florestais já consumiram mais de 500 mil hectares no sul da Austrália. Fumaça atinge Sydney e qualidade do ar está crítica.', CURRENT_DATE, 5); commit;

-- comentario_gs
insert into comentario_gs (id, conteudo, data_comentario, id_usuario, id_publicacao) values ( id_comentario.nextval, 'Incêndios florestais já consumiram mais de 500 mil hectares no sul da Austrália. Fumaça atinge Sydney e qualidade do ar está crítica.', CURRENT_DATE, 5); commit;
insert into comentario_gs (id, conteudo, data_comentario, id_usuario, id_publicacao) values (id_comentario.nextval, 'Um forte terremeto de magnitude 7.2 atingiu a região costeria do Japão, causando danos estruturais e interrupção no fornecimento de energia', CURRENT_DATE, 4); commit;
insert into comentario_gs(id, conteudo, data_comentario, id_usuario, id_puplicacao) values (id_comentario.nextval, 'Enchentes severas deixaram milhares de pessoas desalojadas no norte da Índia. As águas continuam subindo e o governo está mobilizando equipes de resgate.',CURRENT_DATE, 3); commit;
insert into comentario_gs(id, conteudo, data_comentario, id_usuario, id_publicacao) values (id_comentario.nextval, 'O furacão categoria 4 atingiu a costa do Caribe, causando fortes ventos, destruição de casas e cortes de comunicação em várias ilhas.', CURRENT_DATE, 2); commit;
insert into comentario_gs(id, conteudo, data_comentario, id_usuario, id_publicacao) values (id_comentario.nextval, 'Deslizamentos de terra causados por chuvas intensas na região montanhosa da Colômbia deixaram várias comunidades isoladas e em estado de emergências.', CURRENT_DATE, 1); commit;

-- area_risco_gs

--enchentes
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'centro', 'Enchentes', CURRENT_DATE, 1); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Jardim das Flores', 'Enchentes', CURRENT_DATE, 2); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Vila Nova', 'Enchentes', CURRENT_DATE, 3); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Bairro Industrial', 'Enchentes', CURRENT_DATE, 4); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Rua das Palmeiras', 'Enchentes', CURRENT_DATE, 5); commit;

--queda de energia
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Rua principal', 'Queda de energia', CURRENT_DATE, 1); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Avenida Brasil', 'Queda de energia', CURRENT_DATE, 2); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Centro', 'Queda de energia', CURRENT_DATE, 3); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Bairro São João', 'Queda de energia', CURRENT_DATE, 4); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Rua das Mangueiras', 'Queda de energia', CURRENT_DATE, 5); commit;

--eventos comunitários
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Praça central', 'Evento comunitário', CURRENT_DATE, 1); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Escola municipal', 'Evento comunitário', CURRENT_DATE, 2); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Quadra da Vila Nova', 'Evento comunitário', CURRENT_DATE, 3); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Associação de Moradores', 'Evento comunitário', CURRENT_DATE, 4); commit;
insert into area_risco_gs (id, endereco, tipo_risco, data, id_usuario) values (id.nextval, 'Ginásio Poliesportivo', 'Evento comunitário', CURRENT_DATE, 5); commit;
-- jogo_gs
insert into jogo_gs (id, pontos, id_usuario) values ( id_jogo.nextval, 1, 1 ); commit;
insert into jogo_gs (id, pontos, id_usuario) values ( id_jogo.nextval, 2, 2 ); commit;
insert into jogo_gs (id, pontos, id_usuario) values ( id_jogo.nextval, 1, 3 ); commit;
insert into jogo_gs (id, pontos, id_usuario) values ( id_jogo.nextval, 2, 4 ); commit;
insert into jogo_gs (id, pontos, id_usuario) values ( id_jogo.nextval, 3, 5 ); commit;

-- Querys
-- 1. Listar os usuários com o nome, email e a quantidade total de pontos no jogo.
select usuario_gs.nome AS Usuarios, usuario_gs.email AS Email, SUM(jogo_gs.pontos) AS Pontos_Totais
from usuario_gs
LEFT JOIN jogo_gs ON usuario_gs.id = jogo_gs.id_usuario
GROUP BY usuario_gs.id, usuario_gs.nome, usuario_gs.email
ORDER BY 3 DESC;



drop sequence id_usuario;
drop sequence id_publicacao;
drop sequence id_comentario;
drop sequence id_area_risco;
drop sequence id_jogo;

DROP TABLE jogo_gs;
DROP TABLE area_risco_gs;
DROP TABLE comentario_gs;
DROP TABLE publicacao_gs;
DROP TABLE usuario_gs;

-- Select
SELECT * FROM usuario_gs;
SELECT * FROM publicacao_gs;
SELECT * FROM jogo_gs;

