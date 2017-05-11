class Recipe < ActiveRecord::Base
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :instructions
  has_many :ingredient_assignments
  has_many :ingredients, through: :ingredient_assignments
  has_many :category_assignments
  has_many :categories, through: :category_assignments

  validates :name, :presence => true
end
