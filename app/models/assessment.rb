class Assessment < ApplicationRecord
  include CmAdmin::Assessment
  belongs_to :assessable, polymorphic: true

  scope :with_one, -> {
    where('title ILIKE ?', '%one%')
  }
end
