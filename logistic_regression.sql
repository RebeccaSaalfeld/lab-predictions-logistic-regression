
    #Create a query or queries to extract the information you think may be relevant for building the prediction model. It should include some film features and some rental features. Use the data from 2005.
    #Create a query to get the list of films and a boolean indicating if it was rented last month (August 2005). This would be our target variable.
    #Read the data into a Pandas dataframe.
    #Analyze extracted features and transform them. You may need to encode some categorical variables, or scale numerical variables.
    #Create a logistic regression model to predict this variable from the cleaned data.
    #Evaluate the results.
USE sakila;

SELECT f.film_id, f.title, f.release_year, f.rental_duration, f.length, 
                    f.rating, f.special_features, r.customer_id, r.rental_id, c.name as genre, 
                    l.name as language, r.staff_id, f.rental_rate,
                    CASE WHEN r.rental_date LIKE '2005-05%%' THEN 'True'
                    ELSE 'False'
                    END AS 'Rented'
                    FROM sakila.rental AS r
                    INNER JOIN sakila.inventory AS i USING(inventory_id)
                    LEFT JOIN sakila.film AS f USING (film_id)
                    INNER JOIN sakila.language AS l USING (language_id)
                    INNER JOIN sakila.film_category AS fc USING (film_id)
                    INNER JOIN sakila.category AS c USING (category_id)
                    WHERE r.rental_date LIKE '2005%%';
                    
SELECT * from sakila.film;