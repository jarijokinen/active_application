class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  scope :latest, -> { order("created_at DESC").limit(10) }

  def to_s
    title
  end
end
