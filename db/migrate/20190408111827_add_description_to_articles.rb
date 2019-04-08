class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :description, :text #add_column table_name, column_name, datatype.
    add_column :articles, :created_at, :datetime
    add_column :articles, :deleted_at, :datetime
  end
end
