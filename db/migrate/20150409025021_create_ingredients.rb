class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.belongs_to :juicerecipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :ingredients, :juicerecipes
  end
end
