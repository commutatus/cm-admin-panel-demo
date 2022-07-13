class Log < ApplicationRecord
  include CmAdmin::Log
  belongs_to :loggable, polymorphic: true
end
