require "bundler/setup"
require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Dice Roll</h1>

  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end

=begin
GET /dice/2/6 (simulate two 6-sided dice)
GET /dice/2/10 (simulate two 10-sided dice)
GET /dice/1/20 (simulate one 20-sided die)   
GET /dice/5/4 (simulate five 4-sided dice)
=end

get("/dice/2/6") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)
  sum = first_dice + second_dice

  outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."

  body = +"<h1>1d20</h1>"
  body << "<p>#{outcome}</p>"
  body
end

get("/dice/2/10") do
  first_dice = rand(1..10)
  second_dice = rand(1..10)
  sum = first_dice + second_dice

  outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."

  body = +"<h1>1d20</h1>"
  body << "<p>#{outcome}</p>"
  body
end

get("/dice/1/20") do
  dice = rand(1..20)
  outcome = "You rolled a #{dice}"

  body = +"<h1>1d20</h1>"
  body << "<p>#{outcome}</p>"
  body
end

get("/dice/5/4") do
  dices = []
  4.times do |dice|
    dice = rand(1..4)
    dices.push(dice)
  end
  body = +"<h1>1d20</h1>"
  body << dices.map { |num| "<p>#{num}</p>" }.join
  body
end
