-- atividades 23/09

-- Listar quantos livros cada autor publicou por editora (BD Biblioteca).

select a.nome as autor, e.nome as editora, count(l.id_livro) as total_livros
from autor a
inner join livro l on a.id_autor = l.id_autor
inner join editora e on l.id_editora = e.id_editora
group by a.nome, e.nome
order by total_livros desc;

-- Listar a média de páginas dos livros por autor (BD Biblioteca).

select a.nome as autor, avg(l.paginas) as media_paginas
from autor a
join livro l on a.id_autor = l.id_autor
group by a.id_autor;

-- Mostrar o total de campanhas por reservatório e instituição (limnologia_db).

select r.nome as reservatorio, i.nome as instituicao, count(c.id_campanha) as
total_campanhas
from campanha c
inner join reservatorio r on c.id_reservatorio = r.id_reservatorio
inner join instituicao i on c.id_instituicao = i.id_instituicao
group by r.nome, i.nome
order by total_campanhas desc;

-- Mostrar a média de valores de parâmetros por reservatório (limnologia_db).

select r.nome as reservatorio, p.nome_parametro, avg(s.valor) as media_valores
from serie_temporal s
inner join reservatorio r on s.id_reservatorio = r.id_reservatorio
inner join parametro p on s.id_parametro = p.id_parametro
group by r.nome, p.nome_parametro;

-- Listar as instituições que coletaram em mais de um reservatório (limnologia_db).

select i.nome AS instituicao, count(distinct c.id_reservatorio) as
total_reservatorios
from instituicao i
inner join campanha c on i.id_instituicao = c.id_instituicao
group by i.nome
having count(distinct c.id_reservatorio) > 1;
