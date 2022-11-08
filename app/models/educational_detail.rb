class EducationalDetail < ApplicationRecord
  include CmAdmin::EducationalDetail
  belongs_to :user
end
