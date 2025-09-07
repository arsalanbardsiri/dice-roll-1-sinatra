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
  @rolls = []

  2.times do
    dice = rand(1..6)
    @rolls.push(dice)
  end
  
  erb(:two_6)
end

get("/dice/2/10") do
  @rolls = []

  2.times do
    dice = rand(1..10)
    @rolls.push(dice)
  end
  
  erb(:two_10)
end

get("/dice/1/20") do
  @rolls = []

  1.times do
    dice = rand(1..20)
    @rolls.push(dice)
  end
  
  erb(:one_20)
end

get("/dice/5/4") do
  @rolls = []

  5.times do
    dice = rand(1..4)
    @rolls.push(dice)
  end
  
  erb(:five_4)
end
