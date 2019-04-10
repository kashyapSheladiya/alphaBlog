class FixNotnullToNullUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :deleted_at, :datetime, null: true
  end
end
