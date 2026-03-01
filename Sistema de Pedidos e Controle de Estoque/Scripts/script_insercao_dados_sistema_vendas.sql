-- 1. CLIENTE

INSERT INTO cliente (codigo, nome, email, data_cadastro) VALUES
(1, 'João Silva', 'joao@email.com', '2024-01-10'),
(2, 'Maria Souza', 'maria@email.com', '2024-01-12'),
(3, 'Empresa Alpha LTDA', 'contato@alpha.com', '2024-01-15');


-- 2. CLIENTE_PF

INSERT INTO cliente_pf (codigo_cliente, cpf, data_nascimento) VALUES
(1, '12345678901', '1995-03-20'),
(2, '98765432100', '1990-07-15');

-- 3. CLIENTE_PJ

INSERT INTO cliente_pj (codigo_cliente, cnpj, razao_social) VALUES
(3, '11222333000199', 'Empresa Alpha LTDA');

-- 4. FONE_CLIENTE

INSERT INTO fone_cliente (codigo_cliente, telefone) VALUES
(1, '11988887777'),
(1, '11977776666'),
(2, '11966665555'),
(3, '1133334444');

-- 5. VENDEDOR

INSERT INTO vendedor (codigo, nome, email, data_admissao) VALUES
(1, 'Carlos Mendes', 'carlos@empresa.com', '2023-05-01'),
(2, 'Ana Lima', 'ana@empresa.com', '2023-08-10');

-- 6. FONE_VENDEDOR

INSERT INTO fone_vendedor (codigo_vendedor, telefone) VALUES
(1, '11999998888'),
(2, '11988889999');

-- 7. PRODUTO

INSERT INTO produto (codigo, nome, descricao, preco_unitario) VALUES
(1, 'Notebook', 'Notebook i5 16GB RAM', 4500.00),
(2, 'Mouse', 'Mouse sem fio', 120.00),
(3, 'Teclado', 'Teclado mecânico', 350.00);

-- 8. PRATELEIRA

INSERT INTO prateleira (codigo, descricao) VALUES
(1, 'Eletrônicos'),
(2, 'Periféricos');

-- 9. CAPACIDADE_ESTOQUE

INSERT INTO capacidade_estoque (codigo_prateleira, capacidade_maxima) VALUES
(1, 100),
(2, 200);

-- 10. ESTOQUE

INSERT INTO estoque (codigo, codigo_produto, codigo_prateleira, quantidade, data_entrada) VALUES
(1, 1, 1, 20, '2024-01-05'),
(2, 2, 2, 50, '2024-01-06'),
(3, 3, 2, 30, '2024-01-07');

-- 11. PEDIDO

INSERT INTO pedido (
codigo, codigo_cliente, codigo_vendedor,
logradouro_entrega, numero_entrega, bairro_entrega, cidade_entrega, estado_entrega,
data_pedido, valor_total
) VALUES
(1, 1, 1, 'Rua A', 100, 'Centro', 'São Paulo', 'SP', '2024-02-01', 4740.00),
(2, 2, 2, 'Av. Brasil', 250, 'Jardins', 'São Paulo', 'SP', '2024-02-02', 350.00);

-- 12. ITEM_PRODUTO

INSERT INTO item_produto (codigo_pedido, codigo_produto, quantidade, valor_unitario, subtotal) VALUES
(1, 1, 1, 4500.00, 4500.00),
(1, 2, 2, 120.00, 240.00),
(2, 3, 1, 350.00, 350.00);

--13. PAGAMENTO

INSERT INTO pagamento (codigo, codigo_pedido, codigo_funcionario, valor_pago, forma_pagamento, data_pagamento) VALUES
(1, 1, 1, 4740.00, 'PIX', '2024-02-01'),
(2, 2, 2, 350.00, 'CARTAO', '2024-02-02');

-- 14. LOG_ALTERACOES

INSERT INTO log_alteracoes (codigo, tabela_afetada, operacao, data_operacao) VALUES
(1, 'PEDIDO', 'INSERT', '2024-02-01'),
(2, 'PAGAMENTO', 'INSERT', '2024-02-01');