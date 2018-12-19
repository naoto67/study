# frozen_string_literal: true

class User < ApplicationRecord
  # users colomn validates
  validates :name, presence: true
  validates :screen_name, presence: true, uniqueness: true

  # password setting
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # auth_token setting
  has_secure_token :auth_token
end
