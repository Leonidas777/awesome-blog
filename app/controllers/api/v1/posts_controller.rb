class Api::V1::PostsController < Api::V1::BaseController
  inherit_resources

  def create

  end

  def post_params
    params.require(:post).permit(:title, :description, :rate, :user_id, :author_ip)
  end
end
