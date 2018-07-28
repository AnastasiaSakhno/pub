class ChangeArrivalCountToFloat < ActiveRecord::Migration
  def self.up
    change_table :arrivals do |t|
      t.change :count, :float
    end
  end

  def self.down
    change_table :arrivals do |t|
      t.change :count, :integer
    end
  end
end
