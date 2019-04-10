class FixColumnNameUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :updated_at, :deleted_at
  end
end
