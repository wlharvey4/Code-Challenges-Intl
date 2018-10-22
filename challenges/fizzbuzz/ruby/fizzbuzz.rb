#!/usr/bin/env ruby
# fizzbuzz.rb
# =============================================================================
# CREATED: 2018-10-22
# UDPATED: 2018-10-22
# VERSION: 1.0.0
# AUTHOR : wlharvey4
# ABOUT  : FIZZBUZZ implemented in Ruby2_5
# USAGE  : fizzbuzz.rb <int> or Fizzbuzz.new({"n" => <int>})
# NOTES  :
# CHANGE-LOG:
# .............................................................................
# version 1.0.0 2018-10-22T11:30
# -- initial commit
# .............................................................................
# version 1.1.0 2018-10-22T16:00
# -- change input to be a hash instead of json
# -- change symbols to strings for easier equality check
# -- remove option to compare two values from the command line
# -----------------------------------------------------------------------------

# Class Fizzbuzz receives a Ruby Hash object as described below, and calculates
# a Fizzbuzz  value, which can  be observed  through either #puts  or #inspect.
class Fizzbuzz
  attr_accessor :n, :out
  # 'input' is a Ruby Hash of the form {"n" => <int>}
  # @n is obtained from the Hash value as a Fixnum
  # @out is calculated as one of <int> | "fizz" | "buzz" | "fizzbuzz"
  def initialize input
    @n    = input["n"]
    @out  = calculate @n
  end

  def calculate n
    fizz = n % 3 == 0
    buzz = n % 5 == 0
    if fizz && buzz
      @out = "fizzbuzz"
    elsif fizz || buzz
      @out = fizz ? "fizz" : "buzz"
    else
      @out = n
    end
  end

  def == expected
      self.out == expected
  end

  def to_s
    "#{@out}"
  end

  def inspect
    "Fizzbuzz of #{@n} is #{@out}"
  end
end

# Fizzbuzz  can be  run from  the  command line  as ruby  fizzbuzz.rb <int>  or
# ./fizzbuzz <int> if it has been made executable and linked.
def main n
  fizzbuzz = Fizzbuzz.new ({"n" => n.to_i})
  p fizzbuzz
end

if $0 == __FILE__
  main $*[0]
end

