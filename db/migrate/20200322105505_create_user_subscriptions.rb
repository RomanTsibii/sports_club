class CreateUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.datetime :date_buy
      t.timestamps
    end
  end
end
