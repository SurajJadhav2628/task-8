Task 8: Stored Procedures and Functions

To create reusable SQL blocks using procedures and functions to modularize logic.

- One stored procedure
- One SQL function

1. Stored Procedure: GetCustomerOrders
   - Purpose: Retrieve all orders placed by a given customer ID.
   - Syntax:
     CALL GetCustomerOrders(1);

2. SQL Function: TotalOrderAmount
   - Purpose: Calculate the total order amount (product price * quantity) for a given order.
   - Syntax:
     SELECT TotalOrderAmount(1);

