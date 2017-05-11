class Ingredient < ActiveRecord::Base
  has_many :ingredient_assignments
  has_many :recipes, through: :ingredient_assignments
end
