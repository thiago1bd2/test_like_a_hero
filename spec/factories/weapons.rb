# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :weapon do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    power_base { FFaker::Random.rand(1..999) }
    power_step { FFaker::Random.rand(1..199) }
    level { 1 }
  end
end
