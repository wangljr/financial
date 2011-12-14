class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.references :account
      t.references :fundType
      t.float :amount

      t.timestamps
    end
    add_index :funds, :account_id
    add_index :funds, :fundType_id
  end
end
