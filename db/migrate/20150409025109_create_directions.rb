class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :step
      t.belongs_to :juicerecipe, index: true

      t.timestamps null: false
    end
    add_foreign_key :directions, :juicerecipes
  end
end
