Fabricator(:course_coach) do
  course_id       { Course.all.pluck(:id).sample }
  user_id         { User.all.pluck(:id).sample }
end