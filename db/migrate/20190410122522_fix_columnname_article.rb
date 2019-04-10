class FixColumnnameArticle < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :deleted_at, :updated_at
  end
end
