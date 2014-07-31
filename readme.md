<h3>Calculating with functions in Ruby</h3>

This code performs arithmetic in the form one(times(two)) for numbers
zero through nine and the four main arithemetic operators.

For example, (nine(times(eight)) returns 72; (four(plus(nine)) returns 13.

I solve this problem by having the operations return functions, or lamdas, 
that can be called by the left side of the equation and return that number
combined with the right side.
