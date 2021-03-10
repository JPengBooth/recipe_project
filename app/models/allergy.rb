# == Schema Information
#
# Table name: allergies
#
#  id            :integer          not null, primary key
#  severity      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ingredient_id :integer
#  user_id       :integer
#
class Allergy < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:ingredient, { :required => false, :class_name => "Ingredient", :foreign_key => "ingredient_id", :counter_cache => true })

  validates(:user_id, { :presence => true })
  validates(:severity, { :presence => true })
  validates(:ingredient_id, { :presence => true })
end
