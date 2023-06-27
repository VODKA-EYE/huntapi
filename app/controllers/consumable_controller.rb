# frozen_string_literal: true

class AmmoTypeController < ApplicationController
  def all
    consumables = Consumable.all.order(:name)
    render json: consumables
  end
end
