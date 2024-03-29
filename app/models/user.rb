# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  user_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :user_name, :uniqueness => true
  has_secure_password
  
  has_many(:recipes, { :class_name => "Recipe", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id", :dependent => :destroy })
  
  has_many(:allergies, { :class_name => "Allergy", :foreign_key => "user_id", :dependent => :destroy })
end
