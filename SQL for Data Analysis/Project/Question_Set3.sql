<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="E:/Coding/Data anaylsis/Udacity Advanced Data Analysis/SQL for Data Analysis/Project/chinook_db/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="3954"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,5:mainAlbum"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="Album" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="61"/><column index="2" value="300"/><column index="3" value="59"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">--1- the most popular music Genre for each country
SELECT *
FROM
(SELECT i.BillingCountry,Count(il.InvoiceId) as purchases ,g.Name as genre_name
FROM Invoice i 
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON t.TrackId = il.Trackid
JOIN Genre g ON t.GenreId = g.GenreId
GROUP by 1,3) sub
GROUP BY BillingCountry
HAVING purchases = max(purchases);

--2- Return all the track names that have a song length longer than the average song length
SELECT Name,Milliseconds FROM Track
WHERE Milliseconds &gt; (SELECT Avg(Milliseconds) from Track)
ORDER by 2 desc;

--3- 
SELECT c.Country,i.total, (c.FirstName||&quot; &quot; ||c.LastName) as Name
FROM Customer c 
join Invoice i on c.CustomerId = i.CustomerId;


SELECT c.Country,max(i.total),(c.FirstName||&quot; &quot; ||c.LastName) as Name
FROM Customer c 
join Invoice i on c.CustomerId = i.CustomerId
GROUP BY Country,Name


</sql><current_tab id="0"/></tab_sql></sqlb_project>
