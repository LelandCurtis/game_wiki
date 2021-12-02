require 'rails_helper'

RSpec.describe 'page indexing all weapons belonging to a particular role' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)
    @role_2 = Role.create!(name: 'role_2', unlocked: true, health: 25)
    @role_3 = Role.create!(name: 'role_3', unlocked: false, health: 30)

    @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
    @weapon_3 = Weapon.create!(name: 'weapon_3', ranged_attack: true, fire_rate: 1.0, damage: 45, role_id: @role_2.id)
    @weapon_4 = Weapon.create!(name: 'weapon_4', ranged_attack: true, fire_rate: 1.5, damage: 70, role_id: @role_2.id)
    @weapon_5 = Weapon.create!(name: 'weapon_5', ranged_attack: false, fire_rate: 1.0, damage: 80, role_id: @role_3.id)
    @weapon_6 = Weapon.create!(name: 'weapon_6', ranged_attack: true, fire_rate: 0.5, damage: 20, role_id: @role_3.id)
  end

  it 'routes properly' do
    visit "/roles/#{@role_1.id}/weapons"
  end

  it 'has a title call "Weapons available to ..Role name"' do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to have_content("Weapons Available to #{@role_1.name}")
  end

  it 'lists all weapons and their attributes' do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to have_content(@weapon_1.name)
    expect(page).to have_content("Ranged Attack? #{@weapon_1.ranged_attack}")
    expect(page).to have_content("Fire Rate: #{@weapon_1.fire_rate}")
    expect(page).to have_content("Damage: #{@weapon_1.damage}")
    expect(page).to have_content(@weapon_2.name)
    expect(page).to have_content("Ranged Attack? #{@weapon_2.ranged_attack}")
    expect(page).to have_content("Fire Rate: #{@weapon_2.fire_rate}")
    expect(page).to have_content("Damage: #{@weapon_2.damage}")
  end

  it "doesn't show data related to other weapons" do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to_not have_content(@weapon_3.name)
  end
end
