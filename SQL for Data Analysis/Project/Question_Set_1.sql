--1- Use the Invoice table to determine the countries that have the most invoices
SELECT BillingCountry,count(*)
FROM Invoice
GROUP BY 1
ORDER BY 2 DESC	
LIMIT 10;

--2- Which city has the best customers
SELECT BillingCity ,sum(total)
FROM Invoice
Group by 1 
ORDER by 2 DESC
limit 1;

--3- Who is the best customer?
SELECT c.CustomerId,(c.FirstName|| ' ' || c.LastName) as Name,sum(i.total)
FROM Customer c
JOIN Invoice i
on  c.CustomerId = i.CustomerId
GROUP BY 1,2
ORDER BY 3 desc;


