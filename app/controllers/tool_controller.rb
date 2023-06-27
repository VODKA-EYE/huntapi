# frozen_string_literal: true

class AmmoTypeController < ApplicationController
  def all
    tools = Tool.all.order(:name)
    render json: tools
  end
end
