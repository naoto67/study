# frozen_string_literal: true

class SessionsController < ApplicationController
  # find user by screen name.
  # it is authorize found user by password
  # if password is incorrect, return 400.
  # if password is correct, return 200 and user's auth token.
  def create
    user = User.find_by(screen_name: params[:screen_name])
    render(json: { status: 400, message: 'not found' }) && return unless user
    if user.login(params[:password])
      render json: { status: 200, data: user.attributes.except('password_digest') }
    else
      render json: { status: 400, message: 'password is incorrect.' }
    end
  end
end
