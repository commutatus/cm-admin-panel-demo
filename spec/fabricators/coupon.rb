Fabricator(:coupon) do
  title               { Faker::Book.unique.title  }
  discount_amount_cents { (2..5).to_a.sample * 10000 }
  user_id             { User.all.pluck(:id).sample }
end