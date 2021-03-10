# == Schema Information
#
# Table name: ingredients
#
#  id               :integer          not null, primary key
#  ingredient_class :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Ingredient < ApplicationRecord
  has_many(:usages, { :class_name => "Usage", :foreign_key => "ingredient_id", :dependent => :destroy })

  has_many(:allergies, { :class_name => "Allergy", :foreign_key => "ingredient_id", :dependent => :destroy })

  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => true })
end
