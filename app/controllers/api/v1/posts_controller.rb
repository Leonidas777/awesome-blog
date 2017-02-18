class Api::V1::PostsController < Api::V1::BaseController
  before_action :build_resource, only: [:create]

  def index
    @posts = Post.all.most_popular(params[:number])

    render 'api/v1/posts/index', status: 200
  end

  def create
    if @resource.save
      render 'api/v1/posts/show', status: 201
    else
      respond_with_errors(@resource)
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, :author_ip)
  end

  def build_resource
    user = current_user
    user = User.create!(login: params[:user_login]) unless user.present?

    post_params_with_user = post_params.merge(user_id: user.id)
    post_params_with_user = post_params_with_user.merge(user_id: user.id)
    @resource = user.posts.new(post_params_with_user)
  end

  def current_user
    @current_user ||= User.find_by(login: params[:user_login])
  end
end
