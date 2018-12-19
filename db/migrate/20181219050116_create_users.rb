# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :screen_name, null: false, default: ''
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
