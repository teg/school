class TimeSlotTimeShouldBeDateTime < ActiveRecord::Migration
  def self.up
    remove_column :time_slots, :time
    add_column :time_slots, :begins_at, :datetime
  end

  def self.down
  end
end
