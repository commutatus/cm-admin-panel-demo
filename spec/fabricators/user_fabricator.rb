Fabricator(:user) do
  email                     { Faker::Internet.email }
  password                  { 'Federation123' }
  first_name                { Faker::Name.first_name }
  last_name                 { Faker::Name.last_name }
  age                       { (18...80).to_a.sample }
  dob                       { DateTime.now - (18...80).to_a.sample.year }
  gender                    { ['male', 'female'].sample }
  mobile_number             { Faker::PhoneNumber.cell_phone }
  is_admin                  { false}

  after_create { |user|
    Fabricate.times(3, :educational_detail, user_id: user.id)
  }
end