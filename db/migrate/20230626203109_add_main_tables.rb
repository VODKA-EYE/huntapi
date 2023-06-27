# frozen_string_literal: true

class AddMainTables < ActiveRecord::Migration[7.0]
  def change
    create_table :ammo_types do |t|
      t.string :name
    end

    create_table :weapons do |t|
      t.string :name
      t.integer :cost
      t.integer :ammo_amount
      t.integer :slot_size
      t.references :ammo_type, foreign_key: { to_table: :ammo_types }
      t.string :image_url
    end

    create_table :tools do |t|
      t.string :name
      t.integer :cost
      t.integer :usages
      t.string :image_url
    end

    create_table :consumables do |t|
      t.string :name
      t.integer :cost
      t.string :image_url
    end
  end
end
