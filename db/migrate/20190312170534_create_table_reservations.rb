class CreateTableReservations < ActiveRecord::Migration
  def change
    create_table :table_reservations do |t|
      t.integer :chat_id, limit: 5, null: false
      t.date :date, null: false
      t.integer :hall
      t.string :table
      t.time :time_from
      t.time :time_lasts_up
      t.time :time_to
      t.string :user_name
      t.string :user_phone
      t.integer :people_number
      t.string :status, null: false, default: :new

      t.timestamps
    end

    add_index :table_reservations, :date
    add_index :table_reservations, :status
  end
end
