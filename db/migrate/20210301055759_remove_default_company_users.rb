# frozen_string_literal: true

class RemoveDefaultCompanyUsers < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :users, :companies
    remove_index :users, :company_id
    remove_reference :users, :company
  end
end
