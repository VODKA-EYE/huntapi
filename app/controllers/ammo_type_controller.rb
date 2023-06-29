# frozen_string_literal: true

class AmmoTypeController < ApplicationController
  before_action :find_ammo_type, only: %i[update destroy]

  def all
    ammo_types = AmmoType.all
    render json: ammo_types
  end

  def create
    if ammo_type_params.present?
      ammo_type = AmmoType.new(ammo_type_params)
      if ammo_type.save
        render json: { message: 'Ammo type created' }
      else
        render json: { error: true, message: ammo_type.errors.full_messages }
        end
    else
      render json: { error: true, message: 'Empty field' }, status: 400
      end
  end

  def destroy
    @ammo_type.delete
  end

  def update
    @ammo_type.update(ammo_type_params)
  end

  private

  def ammo_type_params
    params.require(:ammo_type).permit(:name)
  end

  def find_ammo_type
    @ammo_type ||= AmmoType.find_by_id(params[:id])
    render json: { error: true, message: 'Ammo type not found' } unless @ammo_type
  end
end
