class Chapter < ApplicationRecord
  include CmAdmin::Chapter
  belongs_to :course
  has_many :lessons

  scope :created_this_year, -> { where(created_at: Time.now.beginning_of_year..Time.now.end_of_year) }
end
