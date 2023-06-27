# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'active_record'
require 'activerecord-import'

items = []
CSV.foreach(Rails.root.join('csvfiles', 'AmmoType.csv'), headers: true) do |row|
  items << row.to_h
end
AmmoType.import(items)

items = []
CSV.foreach(Rails.root.join('csvfiles', 'HantDataShort.csv'), headers: true) do |row|
  items << row.to_h
end
Weapon.import(items)

items = []
CSV.foreach(Rails.root.join('csvfiles', 'Tools.csv'), headers: true) do |row|
  items << row.to_h
end
Tool.import(items)

items = []
CSV.foreach(Rails.root.join('csvfiles', 'Consumables.csv'), headers: true) do |row|
  items << row.to_h
end
Consumable.import(items)
