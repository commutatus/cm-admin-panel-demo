class Chapter < ApplicationRecord
  include CmAdmin::Chapter
  belongs_to :course
  has_many :lessons

  scope :advanced, lambda {
    where('title ILIKE ?', '%advanced%')
  }
end
