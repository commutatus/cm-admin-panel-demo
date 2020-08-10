class User < ApplicationRecord
    include SpotlightSearch
    has_many :educational_details, inverse_of: :user
    accepts_nested_attributes_for :educational_details, reject_if: :all_blank, allow_destroy: true
end
