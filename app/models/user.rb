# frozen_string_literal: true

class User < ApplicationRecord
  # users colomn validates
  validates :name, presence: true
  validates :screen_name, presence: true, uniqueness: true

  # password setting
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # auth_token setting
  has_secure_token :auth_token

  # login function
  def login(password)
    # if auth_token has not exist, authenticate by password
    # if user is authorized, generate auth token and return true.
    # unless user is authorized, return false
    if authenticate(password)
      regenerate_auth_token
      true
    else
      false
    end
  end
end
