
-- QUERIES SISTEMA_VENDAS

USE sistema_vendas;


-- Listar todos os pedidos com seus produtos

SELECT 
p.codigo AS pedido,
c.nome AS cliente,
GROUP_CONCAT(pr.nome SEPARATOR ', ') AS produtos,
p.data_pedido,
p.valor_total
FROM pedido p
JOIN cliente c ON p.codigo_cliente = c.codigo
JOIN item_produto ip ON p.codigo = ip.codigo_pedido
JOIN produto pr ON ip.codigo_produto = pr.codigo
GROUP BY p.codigo, c.nome, p.data_pedido, p.valor_total
ORDER BY p.data_pedido;

-- Produtos em estoque com localização

SELECT 
pr.nome AS produto,
pr.descricao,
e.quantidade,
prat.descricao AS prateleira
FROM produto pr
JOIN estoque e ON pr.codigo = e.codigo_produto
JOIN prateleira prat ON e.codigo_prateleira = prat.codigo
ORDER BY pr.nome;

-- Pedidos em atraso (simulação por data)

SELECT 
c.nome AS cliente,
c.email,
p.codigo AS pedido,
p.data_pedido,
DATEDIFF(CURDATE(), p.data_pedido) AS dias_desde_pedido,
(p.valor_total * 0.02) AS multa_simulada
FROM pedido p
JOIN cliente c ON p.codigo_cliente = c.codigo
WHERE DATEDIFF(CURDATE(), p.data_pedido) > 30
ORDER BY dias_desde_pedido DESC;

-- Produtos mais vendidos

SELECT 
pr.nome AS produto,
COUNT(ip.codigo_pedido) AS total_vendas,
SUM(ip.quantidade) AS quantidade_vendida
FROM produto pr
JOIN item_produto ip ON pr.codigo = ip.codigo_produto
GROUP BY pr.codigo, pr.nome
ORDER BY quantidade_vendida DESC;

-- Clientes mais ativos

SELECT 
c.nome AS cliente,
COUNT(p.codigo) AS total_pedidos,
SUM(p.valor_total) AS valor_total_gasto
FROM cliente c
JOIN pedido p ON c.codigo = p.codigo_cliente
GROUP BY c.codigo, c.nome
ORDER BY total_pedidos DESC;

-- Pagamentos realizados

SELECT 
pg.codigo AS codigo_pagamento,
c.nome AS cliente,
p.codigo AS pedido,
pg.valor_pago,
pg.forma_pagamento,
pg.data_pagamento,
v.nome AS vendedor
FROM pagamento pg
JOIN pedido p ON pg.codigo_pedido = p.codigo
JOIN cliente c ON p.codigo_cliente = c.codigo
JOIN vendedor v ON pg.codigo_funcionario = v.codigo
ORDER BY pg.data_pagamento DESC;

-- Pedidos sem pagamento registrado

SELECT 
p.codigo AS pedido,
c.nome AS cliente,
p.data_pedido,
p.valor_total
FROM pedido p
JOIN cliente c ON p.codigo_cliente = c.codigo
LEFT JOIN pagamento pg ON p.codigo = pg.codigo_pedido
WHERE pg.codigo IS NULL;

-- Vendas por vendedor

SELECT 
v.nome AS vendedor,
COUNT(p.codigo) AS total_pedidos,
SUM(p.valor_total) AS valor_vendido
FROM vendedor v
JOIN pedido p ON v.codigo = p.codigo_vendedor
GROUP BY v.codigo, v.nome
ORDER BY valor_vendido DESC;

-- Faturamento mensal

SELECT 
DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes,
SUM(p.valor_total) AS faturamento_total
FROM pedido p
GROUP BY mes
ORDER BY mes;

-- Clientes com pendências financeiras (simulação)

SELECT 
c.nome,
c.email,
COUNT(p.codigo) AS pedidos_em_aberto,
SUM(p.valor_total) AS valor_devido
FROM cliente c
JOIN pedido p ON c.codigo = p.codigo_cliente
LEFT JOIN pagamento pg ON p.codigo = pg.codigo_pedido
WHERE pg.codigo IS NULL
GROUP BY c.codigo, c.nome, c.email;
