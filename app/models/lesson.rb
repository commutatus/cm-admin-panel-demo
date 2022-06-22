class Lesson < ApplicationRecord
  include CmAdmin::Lesson
  belongs_to :chapter
end
