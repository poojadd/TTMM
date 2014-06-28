class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type_id
      t.datetime :date
      t.integer :user_id
      t.float :amount
      t.string :location

      t.timestamps
    end
  end
end
