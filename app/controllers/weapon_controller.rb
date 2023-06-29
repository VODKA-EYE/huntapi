# frozen_string_literal: true

class WeaponController < ApplicationController
  before_action :find_weapon, only: %i[update destroy]

  def all
    weapons = Weapon.all.order(:name)
    render json: weapons, each_serializer: WeaponSerializer
  end

  def create
    if weapon_params.present?
      weapon = Weapon.new(weapon_params)
      if weapon.save
        render json: { message: 'Weapon created' }
      else
        render json: { error: true, message: weapon.errors.full_messages }
        end
    else
      render json: { error: true, message: 'Empty field' }, status: 400
      end
  end

  def destroy
    @weapon.delete
  end

  def update
    @weapon.update(weapon_params)
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :cost, :ammo_amount, :slot_size, :image_url, :ammo_type_id)
  end

  def find_weapon
    @weapon ||= Weapon.find_by_id(params[:id])
    render json: { error: true, message: 'Weapon not found' } unless @weapon
  end
end
