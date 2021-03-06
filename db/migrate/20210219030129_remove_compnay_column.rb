# frozen_string_literal: true

class RemoveCompnayColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :company_id, :string
  end
end
