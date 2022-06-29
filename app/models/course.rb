class Course < ApplicationRecord
  include CmAdmin::Course
  has_many :chapters
  has_many :course_coaches
  has_many :coaches, through: :course_coaches, source: :user
  has_many :assessments, as: :assessable
  has_one :course_detail

  enum level: { beginner: 0, intermediate: 1, advanced: 2 }

  scope :only_beginner, lambda {
    where(level: :beginner)
  }
end
