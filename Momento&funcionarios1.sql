-- Inclua suas próprias informações no departamento de tecnologia da empresa

INSERT INTO momento.funcionarios (primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id) 
VALUES ('Julia', 'Silva', 'juliasilva.2014@momento.org', '515.124.4269', '2023-05-11', 9, 2900.00, 103, 6);

-- A administração está sem funcionários. Inclua alguns colegas de turma nesse departamento. 
INSERT INTO momento.funcionarios (primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
VALUES ('Deivid', 'Moises', 'Deivid@momento.org', '515.124.4269', '2023-05-11', 3, 2900.00, 202, 1),
 ('Maria', 'Clara', 'Maria.clara@momento.org', '515.124.4269', '2023-05-11', 3, 2900.0, 202,1),
 ('Lucas', 'Silva', 'Lucas@momento.org', '515.124.4269', '2023-05-11', 3, 2900.00,202,1)

 -- Agora diga, quantos funcionários temos ao total na empresa?
SELECT COUNT(*) AS total_funcionarios FROM funcionarios;

-- Quantos funcionários temos no departamento de finanças?
SELECT COUNT(*) AS total_funcionarios FROM funcionarios where departamento_id = 10 ;

-- Qual a média salarial do departamento de tecnologia?SELECT AVG(salario) AS media_tecnologia
SELECT AVG(salario) AS media_salarial_tecnologia
FROM funcionarios
WHERE departamento_id = 6;


-- Quanto o departamento de Transportes gasta em salários?
SELECT SUM(salario) as Total_SALARIO_trasnporte from funcionarios where departamento_id = 5;

-- Um novo departamento foi criado. O departamento de inovações. 
Ele será locado no Brasil. Por favor, adicione-o no banco de dados.
insert into momento.departamento (departamento_id,departamento_nome,posicao_id) values (12, 'Inovacoes ',5400);



-- Três novos funcionários foram contratados para o departamento de inovações. 
--Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, 
-- possuem uma filha chamada Maria Antônia que tem 1 anos e adora brincar com cachorros. 
-- Ele será programador.
-- Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. 
-- Ela vai ocupar a posição de desenvolvedora.  
-- Por último, a Gerente do departamento será Sumaia Azevedo. 
-- Casada, duas filhas (Tainã e Nathalia).
-- O salário de todos eles será a média salarial dos departamentos de administração e finanças.


insert into momento.ocupacoes (ocupacao_nome,min_salario,max_salario) 
values ("Programador", 4000,10000),
("Desenvolvedora", 4000,10000),
("Gerente de Inovações", 8000,20000);

INSERT INTO momento.funcionarios (primeiro_nome, sobrenome, email, telefone, data_contratacao, ocupacao_id, salario, gerente_id, departamento_id)
VALUES ('Sumaia', 'Azevedo', 'Sumaia.Azevedo@momento.org', '515.124.4269', '2023-05-11',22, 2900.00, 206, 12),
 ('William', 'Ferreira', 'William.Ferreira@momento.org', '515.124.4269', '2023-05-11', 20, 2900.0, 206,12),
 ('Fernanda', 'Lima', 'Fernanda.Lima@momento.org', '515.124.4269', '2023-05-11', 21, 2900.00,206,12)

 SET SQL_SAFE_UPDATES = 0;

 UPDATE momento.funcionarios AS f1
JOIN (
    SELECT AVG(salario) AS media_salarial
    FROM momento.funcionarios
    WHERE departamento_id IN (1, 10) -- Substitua pelos IDs reais dos departamentos de administração e finanças
) AS subquery
ON 1=1 -- Isso é apenas uma condição verdadeira, pois queremos atualizar todos os novos funcionários
SET f1.salario = subquery.media_salarial
WHERE f1.primeiro_nome IN ('William', 'Fernanda', 'Sumaia');

SET SQL_SAFE_UPDATES = 1;


-- Informe todas as regiões em que a empresa atua acompanhadas de seus países.


SELECT P.pais_name, R.regiao_id, R.regiao_nome
FROM paises P
INNER JOIN regiao R ON R.regiao_id = P.regiao_id;

-- Joe Sciarra é filho de quem?
SELECT D.primeiro_nome,F.funcionario_id
FROM dependentes D
JOIN funcionarios F ON F.funcionario_id = D.funcionario_id
WHERE D.primeiro_nome LIKE "%joe%"
LIMIT 0, 1000;

-- Jose Manuel possui filhos?
-- Consulta 1
select * from funcionarios where primeiro_nome like "%Jose %"

-- Consulta 2
Select * from dependentes where funcionario_id = 112;

-- Qual região possui mais países?
SELECT R.regiao_id, R.regiao_nome, COUNT(P.pais_name) AS total_paises
FROM paises P
INNER JOIN regiao R ON R.regiao_id = P.regiao_id
GROUP BY R.regiao_id, R.regiao_nome
ORDER BY total_paises DESC
LIMIT 1;

-- Exiba o nome cada funcionário acompanhado de seus dependentes.

SELECT F.primeiro_nome AS nome_funcionario, D.primeiro_nome AS nome_dependente
FROM funcionarios F
LEFT JOIN dependentes D ON F.funcionario_id = D.funcionario_id;

--Karen Partners possui um(a) cônjuge?
select * from dependentes where funcionario_id = 146;
