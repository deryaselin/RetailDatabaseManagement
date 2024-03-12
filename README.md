# RetailDatabaseManagement

Database Management System Project
The proper order of my sql files is as follows:
1_Create_Tables.sql
2_Add_Rows.sql
3_Query1.sql
4_Query2.sql
5_Query3.sql
6_Query4.sql
7_Query5.sql
8_Query6.sql
Query 1:
A customer might be eligible for the loyalty program if they spend a total of $1000 or more in a year. The customer relations team might want to use a query to retrieve these customers and send them an offer to join the loyalty program. To gather this information, they might use an SQL query as follows:
In my ERD, I have a CUSTOMER and an ORDER table. According to my model,
A customer may place zero or more orders. An order might be related to one and only one customer. Therefore, there is a zero-to-many relationship between the customer and order where the order is the optional side of the relationship. To construct this relationship, I used the primary key of the CUSTOMER table – CUSTOMER_ID – as the foreign key in ORDER table.
My SQL code consists of nested select statements. In the inner select statement, the query calculates the total amount spent by every single customer and saves it as total_purchased. I have an ORDER_DATE column in my ORDER table. The ADD_MONTHS(SYSDATE, -12) function returns today’s date and add minus 12 months to that. So that a customer’s spending can be chosen only from last year to today’s date. Then the query groups the results by CUSTOMER_ID, making sure that there will be only one output by customer with the sum of their total spendings.
The outer query outputs the customer’s first name from CUSTOMER table and joins it with the inner query. The joining link between the tables is CUSTOMER_ID. The conditional selection is the customers who spend more than or equal to $1000. So, the query returns the customers who spend more than or equal to $1000 based on their id numbers and displays their first name along with phone number. So that the customer relations team could send them a text message.
Query 2:
We know that PREP is a retail store. So, their product range might vary from outdoor tents to emergency kits. Let’s assume that one of the outdoor tents has a production defect and currently is being recalled. Then, the customer relations team might want to reach out to the customers who bought that particular product.
In my ERM, there is not a direct relationship between the CUSTOMER and the PRODUCT tables. The relationships in my model are as follows:
A customer may place zero or more orders. An order might be related to one and only one customer.
(A zero-to-many relationship between the CUSTOMER and the ORDER where the order is the optional side of the relationship.)
An order may include one or more products. A product may be ordered in one or more orders.
(A many-to-many relationship between the ORDER and the PRODUCT entities. To implement this, I constructed an association class called ORDER_LINE between them.)
To be able to select the specific customers based on the ordered product, I have to join all these tables with their primary keys. So, the join part of the code above allows me to go from the customer table to the product table.
I used DISTINCT with the SELECT statement since a customer may order the same product more than once and in different orders. DISTINCT would eliminate the duplicate outputs and return the same customer information only once. The output will display the customer’s first name, last name and phone number. So that the customer relations team could send them a text message.
Query 3:
The HR will probably need a query every week to see what employees worked more than 40 hours in a week before preparing their paychecks to calculate overtime payments. If an employee worked more than 40 hours, they will be paid their regular hourly rate for the first 40 hours. Then, they will be paid 1.5 times for the rest of the hours.
The WHEN, THEN and ELSE statements returns a value based on which criteria is met. In this case, if an employee worked more than 40 hours, their weekly payment is calculated as explained above. Otherwise, the weekly payment is equal to the hourly rate multiplied by total hours worked.
Query 4:
A customer may request a refund for their order. In this case, the customer service representative will have to retrieve the customer’s payment method from the order information. Also, they will have to ensure that the order has been placed within 30 days prior to the refund date.
According to my model, there is not a direct relationship between the ORDER and the PAYMENT tables. Instead, the relationships are as follows:
A customer may place zero or more orders. An order might be related to one and only one customer.
(A zero-to-many relationship between the CUSTOMER and the ORDER where the order is the optional side of the relationship.)
A customer may submit a zero or more payments. A payment might be made by one and only one customer.
(A zero-to-many relationship between the CUSTOMER and the PAYMENT where the payment is the optional side of the relationship.)
So, the CUSTOMER_ID is used as foreign key in the ORDER and the PAYMENT tables to construct the zero-to-many relationships between them and the CUSTOMER table. The SQL code above joins the tables based on this attribute.
Since a customer may not be able to request a refund after 30 days, the WHERE statement selects the orders that meet this criterion.
This would be helpful for customer service to see if an order is placed within the 30 days before proceeding with the refund process.
Query 5:
A store employee may need a query to order products for a specific store when a product is low in stock. According to my data model:
➢ There is a one-to-many relationship between the SUPPLIER and STORE tables.
➢ There is a many-to-many relationship between the SUPPLIER and PRODUCT tables.
➢ PROD_SUPPLIER table is the bridge entity between the SUPPLIER and PRODUCT tables.
The product table has specific information about every single product such as UPC, name, description, amount, unit price, and threshold level. So, the store employe will first need to retrieve the information from the STORE table using the store id number since they will be ordering a product for a specific store. Then, they will have to use the SUPPLIER table because the only way to order a product is by reaching out to a supplier. Then, the PROD_SUPPLIER should be used to access the PRODUCT table since it is the bridge entity between the SUPPLIER and the PRODUCT tables.
This query displays the product name, amount, threshold, unit price, supplier requested date, supplier and store name. It joins four tables based on the primary and foreign keys. The selection conditions are the specific store id (in this case I used 4444440 for the store id that is the id of the specific store where
the employee works at) and the product amount is less than the product threshold so that the employee can see if they should order more products.
Query 6:
The sales team might want to find the best-selling item. To do so, they will need to gather the data from PRODUCT and ORDER tables. However, since there is a many-to-many relationship between these two tables, the bridge entity ORDER_LINE should also be used in the query.
This query will first add the units sold for each product and then order them in descending order. In other words, the best-selling product will be displayed in the first row. WHERE ROWNUM = 1; statement will return only that row. This query would be useful not only to find the best-selling product but also to see the sales record for each product. The user might delete the WHERE ROWNUM = 1; statement and can display all the products from best-selling to the least-selling.
