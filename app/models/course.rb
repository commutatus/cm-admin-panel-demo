class Course < ApplicationRecord
  include CmAdmin::Course

  has_action_trail

  has_many :chapters
  has_many :course_coaches
  has_many :coaches, through: :course_coaches, source: :user
  has_many :assessments, as: :assessable
  has_one :course_detail

  # monetize :price_cents

  store_accessor :meta_data, :seo_keywords

  enum level: { beginner: 0, intermediate: 1, advanced: 2 }

  accepts_nested_attributes_for :chapters, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :course_coaches, reject_if: :all_blank, allow_destroy: true

  scope :only_beginner, lambda {
    where(level: :beginner)
  }
end
