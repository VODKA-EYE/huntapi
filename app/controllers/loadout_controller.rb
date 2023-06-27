# frozen_string_literal: true

class LoadoutController < ApplicationController
  def random
    render json: LoadoutService.random
  end
end
