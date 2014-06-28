class AddDebtToEventTransactions < ActiveRecord::Migration
  def change
    add_column :event_transactions, :debt, :float
  end
end
