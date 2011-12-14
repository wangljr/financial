class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.float :fee
      t.references :category
      t.string :remark

      t.timestamps
    end
    add_index :records, :category_id
  end
end
