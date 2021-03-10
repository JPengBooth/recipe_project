class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :details
      t.string :food_categories

      t.timestamps
    end
  end
end
