Fabricator(:zoom_registration) do
  registrant_name             { Faker::Book.unique.title }
  zoom_id                     { (1..100).to_a.sample }
end