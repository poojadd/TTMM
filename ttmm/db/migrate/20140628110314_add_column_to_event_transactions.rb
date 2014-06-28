class AddColumnToEventTransactions < ActiveRecord::Migration
  def change
    add_column :event_transactions, :attended, :boolean
  end
end
