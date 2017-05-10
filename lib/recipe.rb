class Recipe < ActiveRecord::Base
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :instuctions
  has_many :ingredients
  has_many :category_assignments
  has_many :categories, through: :category_assignments
end
