# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

iona = Lifter.new("Iona", 150)
soundarya = Lifter.new("Soundarya", 100)
danira = Lifter.new("Danira", 300)
akiko = Lifter.new("Akiko", 160)

twenty_four = Gym.new("24 Hour Fitness")
golds = Gym.new("Gold Fitness")

m1 = Membership.new(100, iona, twenty_four)
m2 = Membership.new(100, soundarya, twenty_four)
m3 = Membership.new(200, danira, golds)
m4 = Membership.new(200, akiko, golds)
m5 = Membership.new(200, iona, golds)

binding.pry

puts "Gains!"
