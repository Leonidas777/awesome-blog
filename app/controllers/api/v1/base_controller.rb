class Api::V1::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :json

  PER_PAGE = 20

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :respond_with_500

    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActiveRecord::RecordInvalid,
                with: :respond_with_404
  end

  protected

  def respond_with_errors(resource=nil, status=422)
    result = { success: false }

    result.merge!(errors: resource.errors.messages, all_errors: resource.errors.full_messages) if resource.present?

    render json: result, status: status
  end

  def respond_with_404
    render json: { success: false, all_errors: [t('errors.not_found')] }, status: 404
  end

  def respond_with_500(exception)
    render json: {success: false, all_errors: [t('errors.something_went_wrong')], debug: exception.to_s}, status: 500
  end
end
