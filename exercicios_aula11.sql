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