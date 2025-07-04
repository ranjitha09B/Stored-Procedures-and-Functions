# Stored-Procedures-and-Functions
Let's break down the SQL code, which includes both a stored procedure and a function, and explain each part in detail.

# 1.Creating the Stored Procedure
# Explanation:
* DELIMITER //: Changes the statement delimiter from ; to //. This allows you to define the entire procedure without prematurely ending it with a semicolon.
* CREATE PROCEDURE GetCustomerOrder(IN custId INT): This line defines a stored procedure named GetCustomerOrder that takes one input parameter, custId, which is an integer representing the customer ID.
* DECLARE orderCount INT;: This line declares a variable named orderCount to hold the number of orders for the specified customer.
* SELECT COUNT(*) INTO orderCount: This query counts the number of orders in the orders table where the custome_id matches the input parameter custId and stores the result in the orderCount variable.
* IF orderCount = 0 THEN: This conditional checks if the orderCount is zero.
     * SELECT 'No orders found for this customer.' AS message;: If there are no orders, it returns a message indicating that no orders were found.
     * ELSE: If there are orders, it executes the following query:
           * SELECT o.order_id, o.product_name, o.order_date
           * FROM orders o
           * WHERE o.custome_id = custId;
* END IF;: Ends the conditional block.
* END //: Ends the stored procedure definition.
* DELIMITER ;: Resets the statement delimiter back to ;.

# 2.Calling the Stored Procedure
# CALL GetCustomerOrder(111);
This command executes the stored procedure GetCustomerOrder with 111 as the input parameter for custId. It will return either the orders for customer ID 111 or a message indicating that no orders were found.

# 3.Creating the Function
# Explanation:
* DELIMITER //: Again, changes the statement delimiter to //.
* CREATE FUNCTION GetTotalOrders(custId INT): This line defines a function named GetTotalOrders that takes one input parameter, custId, which is an integer.
* RETURNS INT: Specifies that the function will return an integer value.
* DETERMINISTIC: Indicates that the function will always produce the same result for the same input parameters (it does not modify any data).
* DECLARE totalOrders INT;: Declares a variable named totalOrders to hold the count of orders.
* SELECT COUNT(*) INTO totalOrders: This query counts the number of orders in the orders table where the custome_id matches the input parameter custId and stores the result in the totalOrders variable.
* RETURN totalOrders;: Returns the total number of orders for the specified customer.
* END //: Ends the function definition.
* DELIMITER ;: Resets the statement delimiter back to ;.

# 4.Calling the Function
# SELECT GetTotalOrders(111) AS TotalOrders;
This command calls the function GetTotalOrders with 111 as the input parameter for custId. It returns the total number of orders for customer ID 111 and labels the result as TotalOrders.

# Summary
* Stored Procedure: Use CREATE PROCEDURE to define a reusable block of SQL code that can be executed with parameters. The example provided retrieves user information based on a user ID.
* Function: Use CREATE FUNCTION to define a reusable function that returns a value. The example calculates the total price with a discount based on the total amount.
* I have created a stored procedure to retrieve orders for a specific customer and a function to count the total orders for that customer.
* We can call the stored procedure using CALL and the function using SELECT.
