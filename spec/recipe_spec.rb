require 'spec_helper'

describe Recipe do
  describe '#categories' do
    it 'create a recipe, create a category, push category to recipe' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      category = Category.create({:name => 'American'})
      recipe.categories.push(category)
      expect(recipe.categories()).to eq([category])
    end
  end
  describe '#instructions' do
    it 'create a recipe and create instructions' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      instruction1 = Instruction.create({:step => "wash ur hands", :recipe_id => recipe.id()})
      instruction2 = Instruction.create({:step => "cook the food", :recipe_id => recipe.id()})
      expect(recipe.instructions()).to eq([instruction1, instruction2])
    end
  end
  describe '#ingredients' do
    it 'create a recipe and create ingredients' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      ingredient1 = Ingredient.create({:name => "beef", :amount => 1, :unit => "lbs", :recipe_id => recipe.id()})
      ingredient2 = Ingredient.create({:name => "chicken", :amount => 2, :unit => "lbs", :recipe_id => recipe.id()})
      expect(recipe.ingredients()).to eq([ingredient1, ingredient2])
    end
  end
end
