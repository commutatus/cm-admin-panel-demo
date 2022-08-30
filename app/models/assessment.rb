class Assessment < ApplicationRecord
  include CmAdmin::Assessment
  belongs_to :assessable, polymorphic: true


  testing = "sample"
  p testing
end
