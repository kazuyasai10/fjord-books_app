class RenamePostralCodeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :postral_code, :postal_code
  end
end
