# frozen_string_literal: true

# Class User, the Hero
class User < ApplicationRecord
  enum kind: { knight: 0, wizard: 1 }

  validates :level, numericality: { greather_than: 0, less_than_or_equal_to: 99 }

  def title
    "#{kind} #{nickname} ##{level}"
  end
end
