class ImportUser
  include CSVImporter

  model User # an active record like model

  column :email, to: ->(email) { email.downcase }, required: true
  column :first_name, required: true
  column :last_name

  identifier :email # will update_or_create via :email

  after_build do |user|
    user.password = 'admin123'
  end

  when_invalid :skip # or :abort
end