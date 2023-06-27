# frozen_string_literal: true

class WeaponController < ApplicationController
  def all
    weapons = Weapon.all.order(:name)
    render json: weapons, each_serializer: WeaponSerializer
  end
end
