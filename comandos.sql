-- Cadastrar o novo colaborador Fulano de Tal no novo projeto BI para exercer o papel de Especialista de Neg�cios.

INSERT INTO brh.colaborador (matricula, cpf, nome, salario, departamento, cep, logradouro)
VALUES ('A124', '466.248.470-77', 'John Doe', 963258.00, 'DEPTI', '45667-970', 'Rua Salgado Filho, s/n');

--Papel
INSERT INTO brh.papel (id, nome) 
VALUES (8, 'Especialista de Power BI');

--Projeto
INSERT INTO brh.projeto (id, nome, responsavel, inicio, fim)
VALUES (5, 'BI', 'A124', to_date('2022-10-05', 'yyyy-mm-dd'), to_date('2024-07-10', 'yyyy-mm-dd'));

-- Endereco
INSERT INTO brh.endereco (cep, uf, cidade, bairro)
VALUES ('45667-970', 'BA', 'Castelo Novo', 'Centro');

-- Telefone
INSERT INTO brh.telefone_colaborador (colaborador, numero, tipo)
VALUES
('A124', '(61) 99999-9999', 'C'),
        ('A124', '(61) 3030-4040', 'R');

-- E-mail
INSERT INTO brh.email_colaborador (email, colaborador, tipo)
VALUES ('johndoe@hotmail.com', 'A124', 'P'),
       ('john.doe@brh.com', 'A124', 'T');

-- Dependentes
INSERT INTO brh.dependente (cpf, nome, data_nascimento, parentesco, colaborador)
VALUES ('693.903.580-00', 'Mary Doe', to_date('1981-05-05', 'yyyy-mm-dd'), 'C�njuge', 'A124'),
('749.073.500-90', 'Little Mary Doe', to_date('2011-09-09', 'yyyy-mm-dd'), 'Filho(a)', 'A124');

-- Atribuicao
INSERT INTO brh.atribuicao (projeto, colaborador, papel) 
VALUES (5, 'A124', 8);

-- Mostrar conjuges
SELECT c.matricula AS matricula_colaborador,
d.nome AS nome_dependente,
d.data_nascimento AS data_nascimento_dependente
FROM brh.colaborador c
JOIN brh.dependente d ON c.matricula = d.colaborador
WHERE PARENTESCO='C�njuge';

SELECT c.matricula AS matricula_colaborador, tc.numero AS telefone, tc.tipo AS tipo
FROM brh.colaborador c
JOIN brh.telefone_colaborador tc  ON c.matricula = tc.colaborador 
WHERE tc.tipo ='M' OR  tc.tipo ='C' ORDER BY c.matricula;

-- Maior salario
SELECT c.nome AS nome_colaborador, 
c.salario AS salario_colaborador
FROM brh.colaborador c
WHERE c.salario = (SELECT MAX(salario) FROM brh.colaborador);