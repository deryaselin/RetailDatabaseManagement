SELECT *
FROM(
    SELECT
        p.UPC,
        p.PRODUCT_NAME,
        SUM(ol.quantity) AS total_unit_sold
    FROM
        PRODUCT p
    JOIN
        ORDER_LINE ol ON p.UPC = ol.UPC
    GROUP BY
        p.UPC, p.PRODUCT_NAME
    ORDER BY
        total_unit_sold DESC

)
WHERE ROWNUM = 1;