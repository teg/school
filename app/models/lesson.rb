class Lesson < ActiveRecord::Base
  belongs_to :time_slot
  belongs_to :student
end
