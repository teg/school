class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :name
      t.string :skype
      t.string :email
      t.string :persistence_token
      t.string :crypted_password

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
