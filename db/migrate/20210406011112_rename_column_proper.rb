class RenameColumnProper < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :lgn, :lng
  end
end
