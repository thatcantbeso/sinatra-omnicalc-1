require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/bison")do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
    erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = Math.sqrt(@the_num).to_f
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @principal = params.fetch("users_principal").to_f
  @apr = params.fetch("users_apr").to_f / 100
  @years = params.fetch("users_year").to_f * 12

  @top = @apr * (@principal)
  @bottom = 1 - ((1 + @apr) ** (-1 * @years))

  @payment = @top / @bottom
  erb(:payment_calc_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("users_min").to_f
  @max = params.fetch("users_max").to_f

  @random_number = rand(@min..@max)
  erb(:random_results)
end
