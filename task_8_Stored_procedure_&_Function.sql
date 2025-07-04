
DROP PROCEDURE IF EXISTS GetCustomerOrders;
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT o.order_id, o.order_date, od.product_id, od.quantity
    FROM Orders o
    JOIN OrderDetails od ON o.order_id = od.order_id
    WHERE o.customer_id = cust_id;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION TotalOrderAmount(ord_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(p.price * od.quantity)
    INTO total
    FROM OrderDetails od
    JOIN Products p ON od.product_id = p.product_id
    WHERE od.order_id = ord_id;
    
    RETURN total;
END //

DELIMITER ;


-- Call procedure to get orders of customer 1
CALL GetCustomerOrders(1);

-- Call function to get total order amount of order 1
SELECT TotalOrderAmount(1) AS total_amount;

