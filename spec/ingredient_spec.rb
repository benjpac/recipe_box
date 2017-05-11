require 'spec_helper'

describe Ingredient do
  describe '#recipes' do
    it 'create a recipe, create a ingredient, push recipe to ingredient' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      ingredient = Ingredient.create({:name => 'American'})
      recipe.ingredients.push(ingredient)
      expect(ingredient.recipes()).to eq([recipe])
      expect(recipe.ingredients()).to eq([ingredient])
    end
    it 'create a recipe, create a ingredient through the recipe' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      ingredient = recipe.ingredients.create({:name => 'American'})
      expect(ingredient.recipes()).to eq([recipe])
      expect(recipe.ingredients()).to eq([ingredient])
    end
  end
end
