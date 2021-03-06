# frozen_string_literal: true

class AddCompanyAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :company_admin, :boolean, default: false
  end
end
