class Api::V1::BaseController < ApplicationController
  PER_PAGE = 20

  respond_to :json

  unless Rails.application.config.consider_all_requests_local
    
  end
end
