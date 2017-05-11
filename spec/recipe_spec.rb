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
  describe '#ingredients' do
    it 'create a recipe, create an ingredient, push ingredient to recipe' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      ingredient = Ingredient.create({:name => 'Cheese'})
      recipe.ingredients.push(ingredient)
      expect(recipe.ingredients()).to eq([ingredient])
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
end
