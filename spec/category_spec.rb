require 'spec_helper'

describe Category do
  describe '#recipes' do
    it 'create a recipe, create a category, push recipe to category' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      category = Category.create({:name => 'American'})
      recipe.categories.push(category)
      expect(category.recipes()).to eq([recipe])
      expect(recipe.categories()).to eq([category])
    end
    it 'create a recipe, create a category through the recipe' do
      recipe = Recipe.create({:name => 'Mac n Cheese'})
      category = recipe.categories.create({:name => 'American'})
      expect(category.recipes()).to eq([recipe])
      expect(recipe.categories()).to eq([category])
    end
  end
end
