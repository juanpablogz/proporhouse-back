class CreateNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhoods do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
