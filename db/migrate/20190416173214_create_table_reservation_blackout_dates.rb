class CreateTableReservationBlackoutDates < ActiveRecord::Migration
  def change
    create_table :table_reservation_blackout_dates do |t|
      t.date :date
      t.integer :hall

      t.timestamps
    end

    add_index :table_reservation_blackout_dates, [:date, :hall], unique: true
  end
end
