class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :posts, through: :categories
  attr_accessible :name
end
