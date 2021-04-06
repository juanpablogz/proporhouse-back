class CreatePromisePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :promise_purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.integer :status_promise_purchase

      t.timestamps
    end
  end
end
