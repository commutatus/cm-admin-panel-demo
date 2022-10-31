Fabricator(:educational_detail) do
  educational_type    { [0,1].sample }
  institution         { Faker::Restaurant.name }
  user_id             { User.all.pluck(:id).sample }
  address_line1       { Faker::Address.street_address }
  address_line2       { Faker::Address.secondary_address }
end