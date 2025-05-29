SELECT * FROM Blinkit_data

SELECT COUNT(*) FROM Blinkit_data

-- Cleaning dataset
UPDATE Blinkit_data
SET Item_Fat_Content =
CASE 
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT DISTINCT (Item_Fat_Content) FROM Blinkit_data

-- Total Sales
SELECT CAST(SUM (Total_Sales)/1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM Blinkit_data

-- Average Sales
SELECT CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales
FROM Blinkit_data

--No of Items
SELECT COUNT(*) AS No_of_Items FROM Blinkit_data

-- Average Rating
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating FROM Blinkit_data

-- Total Sales, Avg Sales, No of Items, Avg rating by Fat Content
SELECT Item_Fat_Content, 
		CAST(SUM (Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC

-- Total Sales, Avg Sales, No of Items, Avg rating by Item Type
SELECT Item_Type, 
		CAST(SUM (Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC

-- Fat content by outles for Total Sales, Avg Sales, No of Items, Avg rating
SELECT Outlet_Location_Type, Item_Fat_Content,
		CAST(SUM (Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales DESC

-- Total Sales, Avg Sales, No of Items, Avg rating by Item Type
SELECT Outlet_Establishment_Year,
		CAST(SUM (Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year 

--Percentage of sales by Outlet size
SELECT
	Outlet_Size,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) Over()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM Blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales

-- Sales by outlet Location
SELECT Outlet_Location_Type,
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM Blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

-- All metrics by Outlet type
SELECT Outlet_Type,
		CAST(SUM (Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG (Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM Blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC 