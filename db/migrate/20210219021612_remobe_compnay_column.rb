# frozen_string_literal: true

class RemobeCompnayColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :company_id, :string
  end
end
