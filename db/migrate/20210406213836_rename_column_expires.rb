class RenameColumnExpires < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :expires, :expire
  end
end
