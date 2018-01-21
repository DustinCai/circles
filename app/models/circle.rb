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
      :circle_id,
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

  scope :circle_id, lambda { |query|
    where(id: query)
  }

  def self.options_for_subject
    subjects = ["Intro to C++", "Intro to Java", "Intro to Python", "Intro to WebDev",
                "Intro to PS", "Intro to UNIX", "Swift", "React", "Node.js",
                "Linear Algebra", "Discrete Mathematics", "Statistics", "Calculus",
                "ESL", "Spanish", "Japanese", "French",
                "Biology", "Chemistry", "Physics", "Psychology", "Sociology",
                "Western History", "World History", "Art History"]
    subjects.sort!
    subjects.map.with_index {|x, i| [x, i + 1] }
  end

  def self.get_subject(val)
    options_for_subject[val.to_i + 1][0]
  end

end
