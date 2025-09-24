-- atividades 19/09

-- Listar quantos livros cada autor possui (BD Biblioteca).

select a.nome as autor, count(l.id_livro) as quantidade_livros
from autor a
inner join livro l on a.id_autor = l.id_autor
group by a.id_autor;


-- Mostrar a média de páginas dos livros por editora (BD Biblioteca)

select a.nome as autor, avg(l.paginas) as media_paginas
from autor a
join livro l on a.id_autor = l.id_autor

group by a.id_autor;

-- Listar o total de campanhas por reservatório (limnologia_db)

select r.nome as reservatorio, count(c.id_campanha) as total_campanhas
from reservatorio r
inner join campanha c on r.id_reservatorio = c.id_reservatorio
group by r.nome
order by total_campanhas desc;

-- Mostrar a média de valores de cada parâmetro em séries temporais (limnologia_db)

select p.nome_parametro, AVG(s.valor) as media_valores
from serie_temporal s
inner join parametro p on s.id_parametro = p.id_parametro
group by p.nome_parametro
order by media_valores desc;

-- Exibir apenas as instituições que realizaram mais de 3 campanhas (limnologia_db)

select i.nome as instituicao, count(c.id_campanha) as total_campanhas
from instituicao i
inner join campanha c on i.id_instituicao = c.id_instituicao
group by i.nome
having count(c.id_campanha) > 3
order by total_campanhas desc;
