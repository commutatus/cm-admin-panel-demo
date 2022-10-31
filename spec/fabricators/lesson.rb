Fabricator(:lesson) do
  title               { Faker::Book.unique.title  }
  description         { Faker::Lorem.sentence }
  chapter_id          { Chapter.all.pluck(:id).sample }
end