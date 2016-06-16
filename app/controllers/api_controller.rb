class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  private
  def authenticated?
    authenticate_or_request_with_http_basic {|username, password| User.where( username: username, password: password).present? }
  end

  def current_user
    current_user = User.find_by(username: username, password: password)
  end

  def authorize_user
    list = List.find(params[:id])
    unless current_user == list.user
      render json: { error: "Not Authorized", status: 403 }, status: 403
    end
  end
end
