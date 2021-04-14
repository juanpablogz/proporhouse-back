class AddFieldActiveToTableCore < ActiveRecord::Migration[6.0]
  def up
    add_column :properties, :active, :boolean
    add_column :offers, :active, :boolean
    add_column :promise_purchases, :active, :boolean
  end

  def down
    remove_column :properties, :active, :boolean
    remove_column :offers, :active, :boolean
    remove_column :promise_purchases, :active, :boolean
  end
end
