class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :skype
      t.text :comment
      t.string :persistence_token
      t.string :crypted_password

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
