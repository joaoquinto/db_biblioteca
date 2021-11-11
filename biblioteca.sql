create database if not exists db_Biblioteca;

use db_Biblioteca;

create table if not exists tbl_livro (
id_Livro smallint auto_increment primary key,
nome_Livro varchar(50) not null,
isbn varchar(30) not null,
id_Autor smallint not null,
data_Pub date not null,
preco_Livro decimal not null
);


alter table tbl_Livro add constraint fk_id_Autor foreign key(id_Autor) references tbl_Autores(id_Autor);

alter table tbl_livro add id_Editora smallint not null;
alter table tbl_livro add constraint fk_id_Editora foreign key(id_Editora) references tbl_editoras(id_Editora);

insert into tbl_livro (nome_Livro, isbn, data_Pub, preco_Livro, id_Autor, id_Editora) 
values ("Linux Command Line Shell Scripting","143856969","20091221", 68.35, 5, 4 );

insert into tbl_livro (nome_Livro,isbn,data_Pub,preco_Livro,id_Autor,id_Editora)
 values ("SSH, The Secure Shell", 127658789, "20091221", 58.30, 1 , 2);
 
insert into tbl_livro (nome_Livro,isbn, data_Pub,preco_Livro,id_Autor,id_Editora) 
values ("Using Samba",123856789,"20011221",61.45,2,2);

insert into tbl_livro (nome_Livro,isbn,data_Pub,preco_Livro,id_Autor,id_Editora)
 values ("Fedora and Red Hat Linux",123346789,"20101101",62.24,3,1);
 
insert into tbl_livro (nome_Livro,isbn,data_Pub,preco_Livro,id_Autor,id_Editora) 
values ("Windows Server 2012 Inside Out", 123356789, "20040517",66.80,4,3);

insert into tbl_livro (nome_Livro,isbn,data_Pub,preco_Livro,id_Autor,id_Editora) 
values ("Microsoft Exchange Server 2010",1233666789,"2001221",45.30, 4,3);

SELECT L.nome_Livro AS "Livro", L.isbn AS "ISBN",L.preco_Livro AS "Preço", A.nome_Autor AS "Preço", E.nome_Editora AS "Editora" FROM tbl_livro AS L INNER JOIN tbl_autores AS A ON L.id_Autor = A.id_Autor INNER JOIN tbl_editoras AS E ON L.id_Editora = E.id_Editora ORDER BY E.nome_Editora;

create table if not exists tbl_autores(
id_Autor smallint primary key,
nome_Autor varchar(50),
sobrenome_Autor varchar(60)
);

insert into tbl_autores (id_Autor,nome_Autor,sobrenome_Autor) values (1,"Daniel", "Barret");
insert into tbl_autores (id_Autor, nome_Autor,sobrenome_Autor) values (2, "Gerald", "Carter");
insert into tbl_autores (id_Autor, nome_Autor, sobrenome_Autor) values (3,"Mark","Sobel");
insert into tbl_autores (id_Autor,nome_Autor,sobrenome_Autor) values (4,"William","Stanek");
insert into tbl_autores (id_Autor,nome_Autor,sobrenome_Autor) values (5,"Richard","Blum");

create table if not exists tbl_editoras(
id_Editora smallint primary key auto_increment,
nome_Editora varchar(50) not null
);

insert into tbl_editoras (nome_Editora) value ("Prentice Hall");
insert into tbl_editoras (nome_Editora) value ("O Reilly");
insert into tbl_editoras (nome_Editora) value ("Microsoft Press");
insert into tbl_editoras (nome_Editora) value ("Wiley");

CREATE VIEW vw_LivrosAutores AS SELECT tbl_livro.nome_Livro AS Livro, tbl_autores.nome_Autor AS Autor 
FROM tbl_livro INNER JOIN tbl_autores ON tbl_livro.id_Autor = tbl_autores.id_Autor;

ALTER VIEW vw_LivrosAutores AS SELECT tbl_livro.nome_Livro AS Livro,preco_Livro AS Valor, tbl_autores.nome_Autor AS Autor 
FROM tbl_livro INNER JOIN tbl_autores ON tbl_livro.id_Autor = tbl_autores.id_Autor;

SELECT * FROM vw_LivrosAutores;

CREATE PROCEDURE verPreco(varLivro SMALLINT)
SELECT nome_Livro, concat('O preço é ', preco_Livro) AS Preço FROM tbl_livro WHERE id_Livro = varLivro;

DROP PROCEDURE verPreco;

CALL verPreco(1);


DELIMITER // 

CREATE FUNCTION calcula_imposto(salario DEC(8,2))RETURNS DEC(8,2)
BEGIN

DECLARE valor_imposto DEC(8,2);

IF salario < 1000.00 THEN
	SET valor_imposto = 0.00;
ELSEIF salario < 2000.00 THEN
	SET valor_imposto = salario * 0.15;
ELSEIF salario < 3000.00 THEN
	SET valor_imposto = salario * 0.22;
ELSE
	SET valor_imposto = salario * 0.27;
END IF;
RETURN valor_imposto;
END//
DELIMITER ;

SELECT calcula_imposto(1000.00);









