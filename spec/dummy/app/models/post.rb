class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  attr_accessible :content, :title

  scope :latest, -> { order("created_at DESC").limit(10) }

  def to_s
    title
  end
end
