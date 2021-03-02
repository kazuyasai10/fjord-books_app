# frozen_string_literal: true

class AddCompanyUsers < ActiveRecord::Migration[6.1]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :users, :company, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
