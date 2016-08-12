class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.belongs_to :record, index: true
      t.timestamps
    end
  end
end
