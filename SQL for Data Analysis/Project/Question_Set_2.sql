--1- email, first name, last name, and Genre of all Rock Music listeners
SELECT c.Email,(c.FirstName|| ' ' || c.LastName) as Name
,g.Name as Genre_Name
FROM Customer c 
JOIN Invoice i 
ON i.CustomerId = c.CustomerId
JOIN InvoiceLine il
on i.InvoiceId = il.InvoiceId
JOIN Track t
ON t.TrackId = il.TrackId
JOIN Genre g
on g.GenreId = t.GenreId
WHERE Genre_Name = 'Rock'
GROUP by 1
ORDER by 1;

--2- Who is writing the rock music
SELECT ar.Name as Artist_Name,count(t.TrackId) as Songs
FROM Artist ar 
JOIN Album al
ON ar.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN Genre g
ON g.GenreId = t.GenreId
WHERE g.Name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC;

--3- find which artist has earned the most according to the InvoiceLines?

SELECT ar.Name as Artist_Name,(count(il.Quantity) * il.UnitPrice) as Amount_spent
FROM Artist ar 
JOIN Album al
ON ar.ArtistId = al.ArtistId
JOIN Track t
ON t.AlbumId = al.AlbumId
JOIN InvoiceLine il
ON il.TrackId = T.TrackId
JOIN invoice i 
ON i.InvoiceId = il.InvoiceId
GROUP BY 1
ORDER BY 2 desc;


