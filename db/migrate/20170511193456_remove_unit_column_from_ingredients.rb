class RemoveUnitColumnFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :unit
  end
end
