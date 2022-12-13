class AddAuthorAndStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, foreign_key: true
    add_column :articles, :status, :integer
  end
end
