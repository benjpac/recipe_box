require("bundler/setup")
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @users = User.all()
  erb :index
end

post '/user' do
  name = params["name"]
  @user = User.new({:name => name})
  if @user.save()
    redirect('/user/'.concat(@user.id().to_s()))
  else
    erb :index
  end
end


get '/user/:user_id' do
  @user = User.find(params['user_id'].to_i())
  erb :user
end

post '/recipes/new' do
  erb :create_recipe
end

get '/recipe/:recipe_id' do
  @recipe = Recipe.find(params['recipe_id'].to_i())
  erb :recipe
end
