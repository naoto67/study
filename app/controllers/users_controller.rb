# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    users = User.all
    render json: { status: 200, data: users }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 201, message: 'user was created successfully.' }
    else
      render json: { status: 400, message: 'bad request.' }
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :screen_name, :password, :password_confirmation)
  end
end
