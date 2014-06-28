class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :settled, :boolean, :default => false
  end
end
