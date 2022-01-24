require 'rails_helper'

RSpec.describe 'Weapons', type: :request do
  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/weapons/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/weapons/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /delete" do
  #   it "returns http success" do
  #     get "/weapons/delete"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/weapons/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /weapons' do
    it 'return the success status' do
      get weapons_path
      expect(response).to have_http_status(:success)
    end

    it 'name is presente' do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it 'current power is presente' do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end

    it 'title is presente'do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it 'details link is present' do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include("/weapons/#{weapon.id}")
      end
    end
  end

  describe 'POST /weapons' do
    context 'when it has valid params' do
      it 'creates an weapon with the correct params' do
        weapons_attributes = attributes_for(:weapon)
        post weapons_path, params: { weapon: weapons_attributes }
        expect(Weapon.last).to have_attributes(weapons_attributes)
      end
    end

    context 'when it has no valid params' do
      it 'does not create the weapon' do
        expect do
          post weapons_path, params: { weapon: { name: '', description: '', power_base: 0, power_step: '', level: '' } }
        end.not_to change(Weapon, :count)
      end
    end
  end

  describe 'DELETE /weapons' do
    context 'when the correct id is given' do
      it 'the weapon is succesfully deleted' do
        # the number of weapons is decresed by one
        weapon = create(:weapon)
        before_deleting = Weapon.count
        delete weapon_path(weapon)
        after_deleting = Weapon.count
        expect(after_deleting).to be < (before_deleting)
      end
    end

    context 'when no correct id is given' do
      it 'no weapon was deleted' do
        expect do
          weapon = Weapon.find(Weapon.last)
          delete weapon_path(weapon.id + 1)
        end.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'GET /weapons/id' do
    context 'when the correct id is given' do
      it 'return the success status' do
        weapon = create(:weapon)
        get weapon_path(weapon.id)
        expect(response).to have_http_status(:success)
      end

      it 'name is presente' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.name)
      end

      it 'description is present' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.description)
      end

      it 'power base is present' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.power_base.to_s)
      end

      it 'power step is present' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.power_step.to_s)
      end

      it 'current power is presente' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.current_power.to_s)
      end

      it 'level is present' do
        weapon = create(:weapon)
        get weapon_path(weapon)
        expect(response.body).to include(weapon.level.to_s)
      end
    end
  end
end
