# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  details         :string
#  food_categories :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Recipe < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  has_many(:usages, { :class_name => "Usage", :foreign_key => "recipe_id", :dependent => :destroy })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "recipe_id", :dependent => :destroy })

  validates(:food_categories, { :presence => true })
  validates(:details, { :presence => true })
end
