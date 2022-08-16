class FileImport < ApplicationRecord
  belongs_to :importable, polymorphic: true

  has_one_attached :import_file

end
