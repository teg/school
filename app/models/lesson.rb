class Lesson < ActiveRecord::Base
  validates_presence_of :time_slot, :student
  belongs_to :time_slot
  belongs_to :student
end
