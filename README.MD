# CATATAN PROTO MASZEH
SELECT id_outlet, SUM(quantity) AS total_quantity
FROM products_quantity
GROUP BY id_outlet;outlets


select p.nama_product, pq.id_outlet FROM products as p, products_quantity as pq WHERE p.id = pq.id_product AND pq.id_outlet = 1
