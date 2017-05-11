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

get '/user/:user_id/recipe/:recipe_id/edit' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  erb :edit_recipe
end

get '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id/edit' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @ingredient = Ingredient.find(params['ingredient_id'].to_i())
  erb :edit_ingredient
end

get '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id/edit' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @instruction = Instruction.find(params['instruction_id'].to_i())
  erb :edit_instruction
end

post '/user/:user_id/recipe/edit' do
  name = params["name"]
  @user = User.find(params['user_id'].to_i())
  @recipe = @user.recipes.create({:name => name})
  erb :edit_recipe
end

post '/clear_all' do
  clear_all()
  @users = User.all()
  erb :index
end

patch '/user/:user_id/recipe/:recipe_id/add_ingredient' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  name = params["name"]
  @recipe.ingredients.create({:name => name})
  erb :edit_recipe
end

patch '/user/:user_id/recipe/:recipe_id/add_instruction' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  step = params["step"]
  @recipe.instructions.create({:step => step})
  erb :edit_recipe
end

patch '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id/edit' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @instruction = Instruction.find(params['instruction_id'].to_i())
  step = params["step"]
  @instruction.update({:step => step})
  erb :edit_instruction
end

patch '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id/edit' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @ingredient = Ingredient.find(params['ingredient_id'].to_i())
  name = params["name"]
  @ingredient.update({:name => name})
  erb :edit_ingredient
end

delete '/user/:user_id/recipe/:recipe_id/delete' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @recipe.delete()
  erb :user
end

delete '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id/delete' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @ingredient = Ingredient.find(params['ingredient_id'].to_i())
  @ingredient.delete()
  erb :edit_recipe
end

delete '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id/delete' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @instruction = Instruction.find(params['instruction_id'].to_i())
  @instruction.delete()
  erb :edit_recipe
end

def clear_all
  CategoryAssignment.delete_all()
  Category.delete_all()
  IngredientAssignment.delete_all()
  Ingredient.delete_all()
  Instruction.delete_all()
  Recipe.delete_all()
  UserRecipe.delete_all()
  User.delete_all()
end
