class Chapter < ApplicationRecord
  include CmAdmin::Chapter
  belongs_to :course
  has_many :lessons
end
