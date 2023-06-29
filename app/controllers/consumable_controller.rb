# frozen_string_literal: true

class ConsumableController < ApplicationController
  before_action :find_consumable, only: %i[update destroy]

  def all
    consumables = Consumable.all.order(:name)
    render json: consumables
  end

  def create
    if consumable_params.present?
      consumable = Consumable.new(consumable_params)
      if consumable.save
        render json: { message: 'Consumable created' }
      else
        render json: { error: true, message: consumable.errors.full_messages }
        end
    else
      render json: { error: true, message: 'Empty field' }, status: 400
      end
    end

  def destroy
    @consumable.delete
  end

  def update
    @consumable.update(consumable_params)
  end

  private

  def consumable_params
    params.require(:consumable).permit(:name, :cost, :image_url)
  end

  def find_consumable
    @consumable ||= Consumable.find_by_id(params[:id])
    render json: { error: true, message: 'Consumable not found' } unless @consumable
  end
end
