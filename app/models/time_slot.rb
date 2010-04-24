class TimeSlot < ActiveRecord::Base
  has_many :lessons

  scope :week, lambda {
    where :begins_at => week_range
  }

  class << self
    def week_range
      now = Time.zone.now
      now.beginning_of_week..now.end_of_week
    end

    def each_day
      day = week_range.first
      (0..7).each { |i| yield(day + i.days) }
    end

    def each_slot(day)
      (4..30).each do |offset|
        begins_at = day + (offset * 30).minutes
        yield(slots[begins_at] || new(:begins_at => begins_at))
      end
    end

    def slots
      @slots ||= week.index_by(&:begins_at)
    end
  end

  def dom_attributes
    attributes = {'data-id' => id, 'data-begins_at' => begins_at}
    attributes.delete_if { |_,value| value.nil? }
    attributes.merge!('class' => 'available') if id
    attributes
  end
end
