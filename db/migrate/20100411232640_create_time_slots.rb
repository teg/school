class CreateTimeSlots < ActiveRecord::Migration
  def self.up
    create_table :time_slots do |t|
      t.time :time
      t.integer :max_students

      t.timestamps
    end
  end

  def self.down
    drop_table :time_slots
  end
end
