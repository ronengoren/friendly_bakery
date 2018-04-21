require 'sinatra'
require './products_class'
require 'sendgrid-ruby'
include SendGrid




get '/' do
  erb :index
end

post '/' do
    @name = params[:name]
    @email = params[:email]

    from = Email.new(email: 'ronen.goren@gmail.com')
    to = Email.new(email: @email)
    subject = 'We have some SWEETS for you :)'
    content = Content.new(type: 'text/plain', value: "Cakes: #{@cakes} \n Cookies: #{@cookies} \n Muffins: #{@muffins}")
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SEND_GRID_API'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code

    redirect '/'

    erb :index

end


get '/products' do
  erb :products
end

get '/about' do
  erb :about
end


get '/products/:name' do
  if params[:name] == "cakes"
    @x = Bakery.new
    @chocolate = Pastry.new('cakes', '/images/cake.jpg', 'Chocolate Cake', 'Old fashioned, buttery golden yellow cake, just as moist and dense as Grandma used to make. ', '$23', 5)
    @x.add_pastry(@chocolate)
    @layers = Pastry.new('cakes', '/images/layers.jpg', 'Layers', 'Old fashioned, buttery golden yellow cake, just as moist and dense as Grandma used to make', '$23', 6)
    @x.add_pastry(@layers)
    @birthday_cake = Pastry.new('cakes', '/images/birthday_cake.jpg', 'Birthday Cake', 'Golden Chocolate Amycakes are decorated with ascending gold sprinkles, chocolate ganache drizzle and dark chocolate curls and flakes.', '$23', 6)
    @x.add_pastry(@birthday_cake)
    erb :cakes
  elsif params[:name] == 'cookies'
    @y = Bakery.new
    @blk_and_white = Pastry.new('cookies', '/images/blkandwhite.jpg', 'Black & White', 'Satisfyingly firm and chewy, our delectable chocolate chip cookie is lovingly sprinkled with sizeable semi-sweet morsels of chocolate throughout', '$23', 5)
    @y.add_pastry(@blk_and_white)
    @red_velvet = Pastry.new('cookies', '/images/redvelvet.jpg', 'Red Velvet', 'An incredibly soft sugar cookie with a sweet and colorful frosting creates a mouth-watering combination that will keep you coming back for more', '$23', 5)
    @y.add_pastry(@red_velvet)
    @macaroon = Pastry.new('cookies', '/images/macaroon.jpg', 'Macaroon', 'crunchy cookies in mini snack packs to brighten up your day', '$23', 5)
    @y.add_pastry(@macaroon)
    erb :cookies
  elsif params[:name] == 'muffins'
    @z = Bakery.new
    @chocolatechips = Pastry.new('muffins', '/images/ccmuffin.jpg', 'Chocolate Chips', 'Made with fresh zucchini & carrots. The delicious vegetable company. Gluten free. Dairy free', '$23', 6)
    @z.add_pastry(@chocolatechips)
    @blueberry = Pastry.new('muffins', '/images/bbmuffin.jpg', 'Blueberry', ' Minimum calories for maximum nutrition and pleasure. All natural. 36% daily value of fiber. Part of a heart healthy diet', '$23', 5)
    @z.add_pastry(@blueberry)
    @vanilla = Pastry.new('muffins', '/images/vnlamuffin.jpg', 'Vanilla', 'Part of a heart healthy diet. Vital nutrition, delicious taste. 100 calories. All natural. 4g protein. 1g fat, 2% DV. 7g fiber, 28% DV', '$23', 5)
    @z.add_pastry(@vanilla)
    erb :muffins
  else
    "404"
  end
end
