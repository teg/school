class TimeSlot < ActiveRecord::Base
  has_many :lessons

  scope :upcoming, lambda {
    where :begins_at => upcoming_range
  }

  scope :free,
    joins('LEFT JOIN (SELECT lessons.time_slot_id, count(id) as count FROM lessons GROUP BY time_slot_id) AS ag ON ag.time_slot_id = time_slots.id')
    .where('max_students IS NULL OR ag.count IS NULL OR ag.count < max_students')

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
        if begins_at + 30.minutes > Time.zone.now
          yield(slots[begins_at] || new(:begins_at => begins_at))
        end
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

