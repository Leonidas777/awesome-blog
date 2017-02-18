class Api::V1::RatesController < Api::V1::BaseController

  def create
    @rate = post.rates.new(rate_params)
    if @rate.save
      render 'api/v1/rates/show', status: 201
    else
      respond_with_errors(@rate)
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:value)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
