class Category < ActiveRecord::Base
  belongs_to :blog
  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :name

  def to_s
    name
  end
end
