class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :number_of_lessons
      t.datetime :validity
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
