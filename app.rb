require("bundler/setup")
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @users = User.all()
  erb :index
end

post '/user/new' do
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

post '/user/:user_id/recipe/edit' do
  name = params["name"]
  @recipe = Recipe.new({:name => name})
  @user = User.find(params['user_id'].to_i())
  @user.recipes.push(@recipe)
  erb :edit_recipe
end

get '/user/:user_id/recipe/:recipe_id' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  erb :recipe
end

get '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @ingredient = Recipe.find(params['recipe_id'].to_i())
  erb :edit_ingredient
end

patch '/user/:user_id/recipe/:recipe_id/add_ingredient' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  name = params["name"]
  ingredient = Ingredient.create({:name => name, :recipe_id => @recipe.id()})
  erb :recipe
end
