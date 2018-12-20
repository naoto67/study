# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[update destroy]
  def index
    users = User.pluck(:id, :name, :screen_name, :created_at)
    render json: { status: 200, data: users }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 201, data: { auth_token: user.attributes.except('password_digest') } }
    else
      render json: { status: 400, message: 'bad request.' }
    end
  end

  def update
    if @user.update(user_params)
      render json: { status: 201, message: 'user was updated successfully.' }
    else
      render json: { status: 400, message: 'bad request.' }
    end
  end

  def destroy
    if @user.destroy
      render json: { status: 204, message: 'user was deleted successfully.' }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :screen_name, :password, :password_confirmation)
  end
end
