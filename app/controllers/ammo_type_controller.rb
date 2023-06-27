# frozen_string_literal: true

class AmmoTypeController < ApplicationController
  def all
    ammo_types = AmmoType.all.order(:name)
    render json: ammo_types
  end
end
