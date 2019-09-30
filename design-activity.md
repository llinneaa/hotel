Question | Answer
:------------- | :-------------
What classes does each implementation include? Are the lists the same? | Each implementation includes the same classes - CartEntry, ShoppingCart, and Order.
Write down a sentence to describe each class. | CartEntry: Calculates price for each type of item purchased (e.g. apples). ShoppingCart: Stores the list of items being purchased and calculates the total cost. Order: Calculates the total price with sales tax.
How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper. | A ShoppingCart has many CartEntries, and an Order has one ShoppingCart.
What data does each class store? How (if at all) does this differ between the two implementations? | CartEntry stores unit price and quantity, ShoppingCart stores the entries, and Order stores the cart cost plus tax. The data stored does not differ between the two implementations.
What methods does each class have? How (if at all) does this differ between the two implementations? | In both implementations, the purpose of the program is to calculate the cost. However, in the first implementation, the entire cost is calculated in the Order 'master class.' in the second implementation, the calculations are spread across the three classes.
Consider the Order#total_price method. In each implementation:
Question | Answer
:------------- | :-------------
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order? | In implementation A, the logic to compute the price is entirely retained in Order. In implementation B, the logic is delegated across all the classes based on what information they store individually.
Does total_price directly manipulate the instance variables of other classes? | Implementation A: total price directly manipulates instance variables in CartEntry and ShoppingCart. Implementation B: total price does not directly manipulate instance variables in other classes.
If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify? | There would no longer be a direct relationship between unit price and quantity - at some point (whatever is deemed a 'bulk amount' for quantity), the unit price would decrease. Implementation B would be easier to change because it does not directly rely on the instance variables in the CartEntry class.
Which implementation better adheres to the single responsibility principle? | Implementation B.
Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled? | Implementation B. The calculations in implementation A have a lot of dependencies on other classes.