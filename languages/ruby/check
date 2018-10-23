#!/usr/bin/env ruby

# challenges/languages/ruby/check.rb
# =============================================================================
# CREATED: 2018-10-22
# UPDATED: 2018-10-23
# VERSION: 0.2.0
# AUTHOR : wlharvey4
# ABOUT  : Test runner for CCI Ruby challenges
# USAGE  : ./check <code-challenge>
# NOTES  :
# CHANGE-LOG:
# .............................................................................
# version 0.1.0 2018-10-22T16:30
# -- Initial commit of working version
# .............................................................................
# version 0.2.0 2018-10-23T15:55
# -- String#capitalize capitalized the first character, but downcased the rest;
#    this will not work with camel-cased code challenge names like strCount;
#    so, create a new variable from the command-line arg cc (which turned out
#    to be frozen, and so found that the '+' unary operator created an un-
#    frozen copy) and capitalize the first character using the #[] method;
# -----------------------------------------------------------------------------

require "json"

if $0 == __FILE__			   # this code should be run as a script
  cc = $*[0]				   # code challenge name
  ccClass = +cc				   # need a capitlized version of cc
  ccClass[0] = cc.chr.capitalize	   # to name the code challenge class
  					   # '+' is needed because cl-arg is frozen
  CCI_DIR = "../../challenges"             # relative code challenge directory
  cc_dir = File.absolute_path(cc, CCI_DIR) # absolute code challenge directory
  unless File.directory?(cc_dir)	   # make sure cc_dir exists
    puts "ERROR: #{cc_dir} is not a valid code challenge."
    exit -1
  end
  puts "#{$0} #{cc}"

  					   # construct the code challenge file
					   # name
  cc_file = File.join(cc_dir, "ruby", cc + ".rb")
  load(cc_file)				   # and then load the code challenge
  fn = Object.const_get(ccClass)	   # and then obtain a reference to the
					   # code challenge class name

  json = File.join(cc_dir, cc + ".json")   # construct the JSON test file
  json_data = JSON.load(File.open(json))   # and then load the JSON data

  correct, incorrect = 0, 0		   # keep track of test results
  json_data.each do |json|		   # iterate over the array;
    params   = json["params"]		   # note that JSON.load() parses the
    expected = json["expected"]	   # file data into a Hash object
					   # {"params"=>{"n"=><int>},
					   #  "expected"=><int|str>}

    fb = fn.new(params)			   # calculate a code-challenge value
					   # from a params hash

    if fb == expected			   # check the value against expected
      correct += 1
    else				   # print an error msg if incorrect
      incorrect += 1
      puts "-" * 50
      p "ERROR: test \##{correct + incorrect}", fb
      puts "Received #{fb} but expected #{expected}"
      puts "-" * 50
      puts
    end
  end # JSON_DATA.EACH

  puts "=" * 50				    # output final results
  puts "Attempted: \t#{correct + incorrect}"
  puts "OK:\t\t#{correct}"
  puts "Failed:\t\t#{incorrect}"
  puts "=" * 50
end
