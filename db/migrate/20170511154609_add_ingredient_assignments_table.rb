class AddIngredientAssignmentsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :amount, :unit

    create_table :ingredient_assignments do |t|
      t.column :recipe_id, :integer
      t.column :ingredient_id, :integer
      t.column :amount, :integer
      t.column :unit, :string

      t.timestamps
    end
  end
end
