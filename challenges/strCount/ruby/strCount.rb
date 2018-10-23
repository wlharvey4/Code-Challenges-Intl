#!/usr/bin/env ruby
# Code-Challenges-Intl/challenges/strCount/ruby/strCount.rb
# =============================================================================
# CREATED: 2018-10-23
# UPDATED: 2018-10-23
# VERSION: 1.1.0
# AUTHOR : wlharvey4
# ABOUT  : strCount challenge implemented in Ruby
# NOTES  : String#scan iterates through the string matching the pattern, adding
#	   the match to the result array
# CHANGE-LOG:
# .............................................................................
# version 1.0.0 2018-10-23T15:50
# -- initial implementation
# .............................................................................
# version 1.1.0 2018-10-23T16:20
# -- added #main method for command-line operation;
# -- refactored #inspect for better description
# -----------------------------------------------------------------------------

class StrCount
  attr_reader :str, :char, :count
  def initialize input
    @str   = input["str1"]
    @char  = input["str2"]
    @count = calculate @str, @char
  end
  def calculate str, char
    (str.scan /#{char}/).length
  end
  def to_s
    @count.to_s
  end
  def inspect
    "StrCount of '#{char}' in '#{str}' is #{count}"
  end
  def == c
    self.count == c
  end
end

def main str1, str2
  strCount = StrCount.new({"str1"=>str1,"str2"=>str2})
  p strCount
end

if $0 == __FILE__
  main $*[0], $*[1]
end
