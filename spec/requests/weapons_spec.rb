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

    it 'details link is present'
  end

  describe 'POST /weapons' do
    context 'when it has valid params' do
      it 'creates an weapon with the correct params'
    end

    context 'when it has no valid params' do
      it 'does not create the weapon'
    end
  end

  describe 'DELETE /weapons' do
    context 'when the correct id is given' do
      it 'the weapon is succesfully deleted'
      # the number of weapons is decresed by one
    end

    context 'when no correct id is given' do
      it 'no weapon is found'
      # the number of weapons remains
    end
  end

  describe 'GET /weapons/id' do
    context 'when the correct id is given' do
      it 'return the success status'
      it 'name is presente'
      it 'description is present'
      it 'power base is present'
      it 'power step is present'
      it 'current power is presente'
      it 'level is present'
    end
  end
end
