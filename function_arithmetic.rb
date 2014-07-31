# Calculating with functions in Ruby

# The following allows arithmetic in the form one(times(two)) for numbers
# zero through nine and the four main arithemetic operators.

# For example, (nine(times(eight)) returns 72; (four(plus(nine)) returns 13.

# I solve this problem by having the operations return functions, or lamdas, 
# that can be called by the left side of the equation and return that number
# combined with the right side.

# First, we generate functions for numbers "one" through "nine".
# The functions either have an operation passed in as an argument (and are on the left
# side of the equation) or they don't (and are on the right).  If there is an 
# operation passed in, then it is called with the number passed in as the left side
# of the equation; otherwise just the number is returned.  

word_nums = %w[zero one two three four five six seven eight nine]
nums = (0..9).to_a
word_hash = Hash[word_nums.zip(nums)]

word_nums.each do |word_num|
  define_method(word_num) do |operation = nil|
    num = word_hash[word_num]
    operation ? operation.call(num) : num
  end
end

# Next, we define the four operations as lambdas that return functions.
# So, for example, consider nine(plus(eight)). plus(eight) would return a 
# lambda that takes in a number, left, and adds it to right (here, 8).  
# Then, when we run nine(plus(eight)), there is a lambda passed in as an argument, 
# which is called "operation".  Operation, or the lamda we just created, 
# is then called with the left side, 9, passed in as an argument, returning 17.

def plus(right)
  ->(left){left + right}
end

def minus(right)
  ->(left){left - right}
end

def times(right)
  ->(left){left * right}
end

def divided_by(right)
  ->(left){left / right.to_f} 
end

