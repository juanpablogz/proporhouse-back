class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
