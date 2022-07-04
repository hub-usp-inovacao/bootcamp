# frozen_string_literal: true

class ApplicationController < ActionController::API
  def index
    render json: { message: "Success" }
  end
end
