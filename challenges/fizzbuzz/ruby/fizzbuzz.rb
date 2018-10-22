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
# -----------------------------------------------------------------------------

require "JSON"

# Class Fizzbuzz receives a string of JSON contained in 'input'
# as described below, and calculates a Fizzbuzz value, which
# can be observed through either #puts or #inspect.  Two
# Fizzbuzz values can be compared for equality using #==.
class Fizzbuzz
  attr_accessor :n, :out
  # 'input' is a JSON string of the form {"n": <int>}
  # @n is converted from JSON value into a Fixnum
  # @out is calculated as one of <int> | :fizz | :buzz | :fizzbuzz
  def initialize input
    input = JSON.parse input
    @n    = input["n"]
    @out  = calculate @n
  end

  def calculate n
    fizz = n % 3 == 0
    buzz = n % 5 == 0
    if fizz && buzz
      @out = :fizzbuzz
    elsif fizz || buzz
      @out = fizz ? :fizz : :buzz
    else
      @out = n
    end
  end

  def == other
      self.out == other.out
  end

  def to_s
    "#{@out}"
  end

  def inspect
    "Fizzbuzz of #{@n} is #{@out}"
  end
end

# Fizzbuzz can be run from the command line as ruby fizzbuzz.rb <int>
# or ./fizzbuzz <int> if it has been made executable and linked.
def main n
  fizzbuzz = Fizzbuzz.new "{\"n\": #{n}}"
  p fizzbuzz
end

if $0 == __FILE__
  main $*[0]
end

