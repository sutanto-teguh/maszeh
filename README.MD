# CATATAN PROTO MASZEH
SELECT id_outlet, SUM(quantity) AS total_quantity
FROM products_quantity
GROUP BY id_outlet;outlets

