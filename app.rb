require 'sinatra'
require './products'


get '/' do
  erb :index
  "hello world"
end

get '/products' do
  erb :products_page
  "here you will find all our products"
end


get '/products/:id' do
  if params[:id] == 'cakes'
    @birthday_cake = Cakes.new("Birthday Cake", "$23")
    @chocolate = Cakes.new("Chocolate", "$23")
    @layers = Cakes.new("Layers", "$23")

    erb :cakes
    "cakes"
  elsif params[:id] == 'cookies'
    @blk_and_white = Cookies.new("Black & White Cookie", "$23")
    @red_velvet = Cookies.new("Red Velvet", "$23")
    @macaroon = Cookies.new("Macaroon", "$23")
    erb :cookies
    "here you will find all our cookies"
  elsif params[:id] == 'muffins'
    @chocolatechips = Muffins.new("Chocolate Chips", "$23")
    @blueberry = Muffins.new("Blueberry", "$23")
    @vanilla = Muffins.new("Vanilla", "$23")

    erb :muffins
    "here you will find all our muffins"
  end
end
