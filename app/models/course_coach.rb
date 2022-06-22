class CourseCoach < ApplicationRecord
  include CmAdmin::CourseCoach
  belongs_to :course
  belongs_to :user
end
