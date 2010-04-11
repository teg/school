class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.references :time_slot
      t.references :student
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
