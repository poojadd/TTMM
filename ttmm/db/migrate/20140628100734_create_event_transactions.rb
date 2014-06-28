class CreateEventTransactions < ActiveRecord::Migration
  def change
    create_table :event_transactions do |t|
      t.integer :event_id
      t.integer :user_id
      t.float :paid

      t.timestamps
    end
  end
end
