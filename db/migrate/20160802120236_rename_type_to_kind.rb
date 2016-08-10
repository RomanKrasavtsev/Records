class RenameTypeToKind < ActiveRecord::Migration[5.0]
  def change
    rename_column :records, :type, :kind 
  end
end
