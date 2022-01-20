# frozen_string_literal: true

require 'rails_helper'
require 'ffaker'

RSpec.describe Weapon, type: :model do
  it 'is invalid if the level is not between 1 and 99' do
    weapon = build(:weapon, level: FFaker::Random.rand(100..999))
    expect(weapon).not_to be_valid
  end

  it "current power is equal to the base when the weapons's level is 1" do
    weapon = build(:weapon)
    expect(weapon.current_power).to eq(weapon.power_base)
  end

  it 'current power should be bigger than the base when level is greather than 1' do
    weapon = build(:weapon, level: FFaker::Random.rand(2..99))
    expect(weapon.current_power).to be > weapon.power_base
  end

  it 'returns the correct weapon title' do
    name = FFaker::Lorem.word
    level = FFaker::Random.rand(1..99)
    weapon = build(:weapon, name: name, level: level)
    expect(weapon.title).to eq("#{name} #{level}")
  end
end
