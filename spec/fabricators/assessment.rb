Fabricator(:assessment) do
  title               { Faker::Book.unique.title  }
  description         { Faker::Lorem.sentence }
  assessable_type     { 'Course' }
  assessable_id       { Course.all.pluck(:id).sample }
end