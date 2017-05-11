require("bundler/setup")
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @users = User.all()
  erb :index
end

get '/user/:user_id' do
  @user = User.find(params['user_id'].to_i())
  erb :user
end

get '/user/:user_id/recipe/:recipe_id' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  erb :edit_recipe
end

get '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @ingredient = Ingredient.find(params['ingredient_id'].to_i())
  erb :edit_ingredient
end

get '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id' do
  @user = User.find(params['user_id'].to_i())
  @recipe = Recipe.find(params['recipe_id'].to_i())
  @instruction = Instruction.find(params['instruction_id'].to_i())
  erb :edit_instruction
end

post '/user/new' do
  name = params["name"]
  user = User.new({:name => name})
  if user.save()
    redirect '/user/'+user.id().to_s()
  else
    erb :index
  end
end

post '/user/:user_id/recipe/new' do
  name = params["name"]
  user = User.find(params['user_id'].to_i())
  recipe = user.recipes.create({:name => name})
  if recipe.save()
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()
  else
    erb :user
  end
end

post '/user/:user_id/recipe/:recipe_id/ingredient/new' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  name = params["name"]
  ingredient = recipe.ingredients.create({:name => name})
  if ingredient.save()
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()
  else
    erb :edit_recipe
  end
end

post '/user/:user_id/recipe/:recipe_id/instruction/new' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  step = params["step"]
  instruction = recipe.instructions.new({:step => step})
  if instruction.save()
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()
  else
    erb :edit_recipe
  end
end

post '/clear_all' do
  clear_all()
  @users = User.all()
  erb :index
end

patch '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id/edit' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  instruction = Instruction.find(params['instruction_id'].to_i())
  step = params["step"]
  if instruction.update({:step => step})
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()+'/instruction/'+instruction.id().to_s()
  else
    erb :edit_instruction
  end
end

patch '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id/edit' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  ingredient = Ingredient.find(params['ingredient_id'].to_i())
  name = params["name"]
  if ingredient.update({:name => name})
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()+'/ingredient/'+ingredient.id().to_s()
  else
    erb :edit_ingredient
  end
end

delete '/user/:user_id/recipe/:recipe_id/delete' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  if user.recipes.destroy(recipe)
    redirect '/user/'+user.id().to_s()
  else
    erb :user
  end
end

delete '/user/:user_id/recipe/:recipe_id/ingredient/:ingredient_id/delete' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  ingredient = Ingredient.find(params['ingredient_id'].to_i())
  if recipe.ingredients.destroy(ingredient)
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()
  else
    erb :edit_recipe
  end
end

delete '/user/:user_id/recipe/:recipe_id/instruction/:instruction_id/delete' do
  user = User.find(params['user_id'].to_i())
  recipe = Recipe.find(params['recipe_id'].to_i())
  instruction = Instruction.find(params['instruction_id'].to_i())
  if recipe.instructions.destroy(instruction)
    redirect '/user/'+user.id().to_s()+'/recipe/'+recipe.id().to_s()
  else
    erb :edit_recipe
  end
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
