# frozen_string_literal: true

class WeaponSerializer < ActiveModel::Serializer
  def attributes(*_args)
    hesh = object.attributes.except('ammo_type_id')
    hesh['ammo_type'] = ammo_type
    hesh.symbolize_keys
  end

  def ammo_type
    object&.ammo_type&.name
  end
end
