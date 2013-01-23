class CommentsController < ActiveApplication::Public::ResourceController
  belongs_to :post

  def create
    create! { parent_url }
  end
end
