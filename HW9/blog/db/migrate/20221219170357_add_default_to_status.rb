class AddDefaultToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :status, :integer, default: 0
  end
end

