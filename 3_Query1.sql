SELECT c.CUST_F_NAME, c.CUST_PHONE
FROM CUSTOMER c
JOIN (
  SELECT CUST_ID, SUM(ORDER_TOTAL) as total_purchased
  FROM ORDERS
  WHERE ORDER_DATE >= ADD_MONTHS(SYSDATE, -12)
  GROUP BY CUST_ID
) o
ON c.CUST_ID = o.CUST_ID
WHERE o.total_purchased >= 1000;