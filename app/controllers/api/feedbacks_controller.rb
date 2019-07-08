module Api
  class FeedbacksController < ApplicationController
    def create
      req_body = JSON.parse(request.body.read)
      if req_body['name'].present?
        render json: req_body
      else
        head :bad_request
      end
    end
  end
end
