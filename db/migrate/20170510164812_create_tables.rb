class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :recipes do |t|
      t.column :name, :string
      t.column :average_rating, :integer

      t.timestamps
    end

    create_table :user_recipes do |t|
      t.column :user_id, :integer
      t.column :recipe_id, :integer
      t.column :rating, :integer

      t.timestamps
    end

    create_table :ingredients do |t|
      t.column :recipe_id, :integer
      t.column :name, :string
      t.column :amount, :integer
      t.column :unit, :string

      t.timestamps
    end

    create_table :instructions do |t|
      t.column :recipe_id, :integer
      t.column :step, :string

      t.timestamps
    end

    create_table :categories do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :category_assignments do |t|
      t.column :recipe_id, :integer
      t.column :category_id, :integer

      t.timestamps
    end

  end
end
