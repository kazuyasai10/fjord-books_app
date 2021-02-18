# frozen_string_literal: true

class ChangeColumnsAddNotnullOnAdmins < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :admin, false
    change_column_null :users, :company_admin, false
  end
end
