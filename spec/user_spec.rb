require 'spec_helper'

describe User do
  describe '#recipes' do
    it 'create a user, create a recipe, push recipe to user' do
      user = User.create({:name => 'Zach'})
      recipe = Recipe.create({:name => 'Good recipe'})
      user.recipes.push(recipe)
      expect(user.recipes()).to eq([recipe])
    end
    it 'create a user, create a recipe with instructions and ingredients, push recipe to user' do
      user = User.create({:name => 'Zach'})
      recipe = Recipe.create({:name => 'Good recipe'})
      user.recipes.push(recipe)
      expect(user.recipes()).to eq([recipe])
      expect(recipe.users()).to eq([user])
    end
  end
end
