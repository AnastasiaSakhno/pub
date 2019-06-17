class ChangeTableReservationsChatIdToNullable < ActiveRecord::Migration
  def change
  	change_column :table_reservations, :chat_id, :integer, null: true
  end
end
