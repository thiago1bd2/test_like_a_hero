# frozen_string_literal: true

class Weapon < ApplicationRecord
  validates :level, numericality: { greather_than: 0, less_than_or_equal_to: 99 }
  # validates :name, presence: true, length: { minimum: 3 }

  def current_power
    (power_base + ((level - 1) * power_step))
  end

  def title
    "#{name} #{level}"
  end
end
