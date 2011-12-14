class AddDateToRecords < ActiveRecord::Migration
  def change
    add_column :records, :date, :date
  end
end
