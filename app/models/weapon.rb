# frozen_string_literal: true

class Weapon < ApplicationRecord
  belongs_to :ammo_type
end
