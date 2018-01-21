class Event < ApplicationRecord
  belongs_to :circle

  def self.options_for_type
    [["Goal", 1], ["Meetup", 2]]
  end

  def self.get_event_type(val)
    options = options_for_type
    options[val - 1][0]
  end

end
