class RenameAdderessColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :adderss, :address
  end
end
