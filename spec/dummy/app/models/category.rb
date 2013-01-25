class Category < ActiveRecord::Base
  belongs_to :blog
  has_many :posts
  has_many :comments, through: :posts

  def to_s
    name
  end
end
