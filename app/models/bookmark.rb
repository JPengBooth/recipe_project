# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:recipe, { :required => false, :class_name => "Recipe", :foreign_key => "recipe_id"})

  validates(:user_id, { :presence => true })
  validates(:recipe_id, { :presence => true })
end
