class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :borrower_id
      t.integer :lender_id
      t.float :amount

      t.timestamps
    end
  end
end
