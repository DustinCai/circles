class Circle < ApplicationRecord
  has_many :user_circles
  has_many :users, through: :user_circles
  has_many :events, dependent: :destroy
  
  validates :name, presence: true, length: {minimum: 5, maximum: 20}
  validates :subject, presence: true, numericality: {greater_than: 0}
  validates :size, presence: true, numericality: {greater_than: 1, less_than: 100, only_integer: true}

  filterrific(
    default_filter_params: {circle_size: 4},
    available_filters: [
      :name_query,
      :subject_query,
      :circle_size
    ]
  )
  
  scope :name_query, lambda { |query| 
    return nil if query.blank?

    query = query.to_s.downcase
    query = ('%' + query.gsub('*', '%') + '%').gsub(/%+/, '%')
    where( "(LOWER(circles.name) LIKE ?)", query)
  }

  scope :subject_query, lambda { |query| 
    return nil if query.blank?

    query = query.to_s.downcase
    query = ('%' + query.gsub('*', '%') + '%').gsub(/%+/, '%')
    where( "(LOWER(circles.name) LIKE ?)", query)
  }

  scope :circle_size, lambda { |query|
    where(size: query)
  }

  def self.options_for_subject
    [["Math", 1], ["Biology", 2], ["Chemistry", 3], ["Physics", 4]]
  end

  def self.get_subject(val)
    options_for_subject[val + 1][1]
  end

end
