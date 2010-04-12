class Student < ActiveRecord::Base
  acts_as_authentic
  has_many :lessons
end
