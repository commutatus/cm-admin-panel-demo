Fabricator(:course) do
  title               { Faker::Book.unique.title  }
  description         { Faker::Lorem.sentence }
  level               { Course.levels.keys.sample }

  after_create { |course|
    Fabricate.times(5, :chapter, course_id: course.id)
    Fabricate.times(2, :assessment, assessable_id: course.id)
    Fabricate.times(2, :course_coach, course_id: course.id)
    Fabricate.times(1, :course_detail, course_id: course.id)
  }
end