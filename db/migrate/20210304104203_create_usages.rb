class CreateUsages < ActiveRecord::Migration[6.0]
  def change
    create_table :usages do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :amount

      t.timestamps
    end
  end
end
