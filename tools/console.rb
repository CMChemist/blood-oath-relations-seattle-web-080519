require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end

jim_jones_llc = Cult.new("Peoples Temple", 1972, "Guyana", "We love Cool-Aid.")
cult2 = Cult.new("Morning Sun", 1945, "New York", "123")
cult3 = Cult.new("cult_name 3", 1972, "New York", "456")


jeff = Follower.new("Jeff", 25, "ABC")
sarah = Follower.new("Sarah", 30, "ABC2")
bill = Follower.new("Bill", 23, "ABC3")

jeff.join_cult(jim_jones_llc)
jim_jones_llc.recruit_follower(sarah)
bill.join_cult(jim_jones_llc)
bill.join_cult(cult3)
bill.join_cult(cult2)
jeff.join_cult(cult2)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
