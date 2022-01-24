FactoryBot.define do
  factory :enemy do
    name { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(1..9_999) }
    power_step { FFaker::Random.rand(1..999) }
    level { FFaker::Random.rand(1..99) }
    kind { %w[goblin orc demon dragons].sample }
  end
end
