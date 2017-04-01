# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.

def is_prime?(number)
  if number <= 1
    return false
  end

  idx = 2
  while idx < number
    if number % idx == 0
      return false
    end
    idx += 1
  end
  return true
end

p is_prime?(3)
p is_prime?(4)


# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the 
# highest prime number under 10 is 7.

def highest_prime_number_under(number)

  primes = []

  (1...number).to_a.each do |num|
    if is_prime?(num)
      primes << num 
    end
  end

  primes[-1]

end

p highest_prime_number_under(10)
p highest_prime_number_under(7)





