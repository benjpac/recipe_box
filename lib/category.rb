class Category < ActiveRecord::Base
  has_many :category_assignments
  has_many :recipes, through: :category_assignments
end
