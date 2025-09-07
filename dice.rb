require "bundler/setup"
require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!("0.0.0.0/0.0.0.0")

get("/") do
  erb(:home)
end

get("/dice/2/6") do
  first_dice = rand(1..6)
  second_dice = rand(1..6)
  sum = first_dice + second_dice

  @outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."
  erb(:two_6)
end

get("/dice/2/10") do
  first_dice = rand(1..10)
  second_dice = rand(1..10)
  sum = first_dice + second_dice

  @outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."
  erb(:two_10)
end

get("/dice/1/20") do
  dice = rand(1..20)
  @outcome = "You rolled a #{dice}"
  erb(:one_20)
end

get("/dice/5/4") do
  dices = []
  4.times do |dice|
    dice = rand(1..4)
    dices.push(dice)
  end
  @outcome = dices.map { |num| "<p>#{num}</p>" }.join
  erb(:five_4)
end
