class TimeSlot < ActiveRecord::Base
  has_many :lessons

  scope :upcoming, lambda {
    where :begins_at => upcoming_range
  }

  default_scope order('begins_at')

  class << self
    def upcoming_range
      today = Time.zone.now.beginning_of_day
      today..(today + 2.weeks).end_of_day
    end

    def each_day
      day = upcoming_range.first
      (0...14).each { |i| yield(day + i.days) }
    end

    def each_slot(day)
      (0...48).each do |offset|
        begins_at = day + (offset * 30).minutes
        yield(slots[begins_at] || new(:begins_at => begins_at))
      end
    end

    def slots
      @slots ||= upcoming.index_by(&:begins_at)
    end
  end

  def dom_attributes
    attributes = {'data-id' => id, 'data-begins_at' => begins_at}
    attributes.delete_if { |_,value| value.nil? }
    attributes.merge!('class' => 'available') if id
    attributes.merge!('class' => 'booked') if !(lessons.empty?)
    attributes
  end
end

