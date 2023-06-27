# frozen_string_literal: true

class LoadoutService
  def validate; end

  class << self
    def random
      @slot1 = Weapon.order('random()').first
      @slot2 = Weapon.order('random()').where("slot_size <= (4-#{@slot1.slot_size})").first
      @tools = Tool.order('random()').limit(rand(1..4))
      @consumables = Consumable.order('random()').limit(rand(1..4))

      to_json
    end

    def to_json(*_args)
      {
        "slot1": @slot1.as_json,
        "slot2": @slot2.as_json,
        "tools": @tools.as_json,
        "consumables": @consumables.as_json
      }
    end
  end
end
