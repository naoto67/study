# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(screen_name: params[:screen_name])
    render(json: { status: 400, message: 'not found' }) && return unless user
    if user.login(params[:password])
      render json: { status: 200, data: { auth_token: user.auth_token } }
    else
      render json: { status: 400, message: 'password is incorrect.' }
    end
  end
end
