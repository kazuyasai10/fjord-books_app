# frozen_string_literal: true

class AddCompnayIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :company, null: false, foreign_key: true, default: 0o000
  end
end
