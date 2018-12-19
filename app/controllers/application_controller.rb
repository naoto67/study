# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def authenticate_user!
    @user = User.find(params[:id])
    # check if auth token is correct.
    # rubocop:disable Style/GuardClause
    unless @user.auth_token == request.headers[:Authorization]
      render json: {
        status: 401,
        message: 'this resource must be authorized'
      }
    end
    # rubocop:enable Style/GuardClause
  end
end
