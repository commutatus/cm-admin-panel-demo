class Location < ApplicationRecord
  include CmAdmin::Location

  enum location_type: { country: 0, state: 1, city: 2 }
end
