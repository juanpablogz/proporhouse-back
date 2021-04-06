class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.date :expires
      t.integer :status_offer

      t.timestamps
    end
  end
end
