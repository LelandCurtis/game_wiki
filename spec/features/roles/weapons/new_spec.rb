#   As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'weapons create' do
  before :each do
    @role_1 = Role.create!(name: 'role_1', unlocked: true, health: 20)

    @weapon_1 = Weapon.create!(name: 'weapon_1', ranged_attack: true, fire_rate: 0.5, damage: 30, role_id: @role_1.id)
    @weapon_2 = Weapon.create!(name: 'weapon_2', ranged_attack: false, fire_rate: 0.25, damage: 15, role_id: @role_1.id)
  end

  it 'is linked from the roles_weapons index page' do
    visit "/roles/#{@role_1.id}/weapons"
    expect(page).to have_link('Create New Weapon')
    click_link "Create New Weapon"
    expect(current_path).to eq("/roles/#{@role_1.id}/weapons/new")
  end

  it 'has a form that creates a new weapon and redirects to roles_weapons index' do
    visit "/roles/#{@role_1.id}/weapons/new"
    expect(page).to have_button('Create Weapon')

    fill_in "name", with: 'New Weapon'
    select "True", from: 'ranged_attack'
    fill_in "damage", with: 99
    fill_in "fire_rate", with: 1.6

    click_button('Create Weapon')
    weapon_id = Weapon.last.id
    expect(current_path).to eq("/roles/#{@role_1.id}/weapons")
    expect(page).to have_content("New Weapon")
  end
end
