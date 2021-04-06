class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :neighborhood, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :lat
      t.float :lgn

      t.timestamps
    end
  end
end
