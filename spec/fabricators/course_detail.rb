Fabricator(:course_detail) do
  share_link            { Faker::Internet.domain_name }
  page_visit            { (1..100).to_a.sample }
end