# == Schema Information
#
# Table name: usages
#
#  id            :integer          not null, primary key
#  amount        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :integer
#  recipe_id     :integer
#
class Usage < ApplicationRecord
  belongs_to(:recipe, { :required => false, :class_name => "Recipe", :foreign_key => "recipe_id" })

  belongs_to(:ingredient, { :required => false, :class_name => "Ingredient", :foreign_key => "ingredient_id" })

  validates(:recipe_id, { :presence => true })
  validates(:ingredient_id, { :presence => true })
  validates(:amount, { :presence => true })
end
