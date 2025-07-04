use empl;

DELIMITER //
CREATE PROCEDURE GetCustomerOrder(IN custId INT)
BEGIN
    DECLARE orderCount INT;

    SELECT COUNT(*) INTO orderCount
    FROM orders
    WHERE custome_id = custId;

    IF orderCount = 0 THEN
        SELECT 'No orders found for this customer.' AS message;
    ELSE
        SELECT o.order_id, o.product_name, o.order_date
        FROM orders o
        WHERE o.custome_id = custId;
    END IF;
END //

DELIMITER ;

call GetCustomerOrder(111);

DELIMITER //
CREATE FUNCTION GetTotalOrders(custId INT)
RETURNS INT
deterministic
BEGIN 
    DECLARE totalOrders INT;

    SELECT COUNT(*) INTO totalOrders
    FROM orders
    WHERE custome_id = custId;

    RETURN totalOrders;
END //
DELIMITER ;

SELECT GetTotalOrders(111) AS TotalOrders;