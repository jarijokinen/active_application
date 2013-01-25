class CommentsController < ActiveApplication::Public::ResourceController
  belongs_to :post

  def create
    create! { parent_url }
  end

  private

  def resource_params
    params.require(:comment).permit(:content)
  end
end
