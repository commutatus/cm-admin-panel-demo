class ZoomRegistration < ApplicationRecord
  has_rich_text :body_text if defined? ActionText::RichText
  has_one_attached :cover_image  if defined? ActionText::RichText
  include CmAdmin::ZoomRegistration
end
