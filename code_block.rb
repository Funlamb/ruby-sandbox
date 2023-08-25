# single-line block
[1, 2, 3].each {|num| p num}

[1, 2, 3].each do |num|
    puts num
end

# Yield to user
def logger
    yield
end
logger {puts "Help"}
logger do 
    p [1, 2, 3]
end

def double_yield
    yield('Ruby')
    yield('Rails')
end
double_yield{|lang| p "I Love #{lang}"}

@transactions = [10, -15, 25, 30, -24, 75, -55]
def transaction_statement
    formatted_transactions = []
    @transactions.each do |transaction|
        formatted_transactions << yield(transaction)
    end
    p formatted_transactions
end
transaction_statement do |transaction|
    "%0.2f" % transaction
end

def hash_method
    hash = {a: 'apple', b: 'banana', c: 'cat'}
    hash.each do |key, value|
        yield key, value
    end
end
hash_method{|key, value| p "#{key}, #{value}"}

def maybe_block
    if block_given?
        puts "Block Party"
    end
    puts "Printed anyway"
end
maybe_block
maybe_block {}

# lambdas
my_lambda = lambda {puts "my lambda"}
my_other_lambda = -> {puts "my other lambda"}
my_lambda.call
my_other_lambda.call

# lambdas with arguments
my_name = ->(name) { puts "hello #{name}" }
my_age = lambda { |age| puts "I am #{age} years old" }
my_name.call("Tim")
my_age.call(42)

# Procs are like lambdas
my_proc = Proc.new {|name="Bob"| puts name}
my_proc.call
my_proc.call("Mike")