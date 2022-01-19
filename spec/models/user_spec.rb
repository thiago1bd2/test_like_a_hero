# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid if the level is not between 1 and 99' do
    user = build(:user, level: FFaker::Random.rand(1..99_999))
    expect(user).not_to be_valid
  end

  it 'returns the correct hero title' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(1..9)
    user = create(:user, nickname: nickname, kind: kind, level: level)
    expect(user.title).to eq("#{kind} #{nickname} ##{level}")
  end
end
