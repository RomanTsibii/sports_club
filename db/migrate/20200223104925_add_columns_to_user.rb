class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :from, :string
    add_column :users, :about, :text
    add_column :users, :sex, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :body_weight_index, :integer
    add_column :users, :age, :integer
    add_column :users, :visible, :boolean, default: true

  end
end
