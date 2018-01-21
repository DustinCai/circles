class Event < ApplicationRecord
  belongs_to :circle

  def self.options_for_type
    [["Goal", 1], ["Meetup", 2]]
  end
end
