Fabricator(:chapter) do
  title               { Faker::Book.unique.title  }
  description         { Faker::Lorem.sentence }
  course_id           { Course.all.pluck(:id).sample }

  after_create { |chapter|
    Fabricate.times(5, :lesson, chapter_id: chapter.id)
  }
end