require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # describe 'GET /index' do
  #   it 'returns http success' do
  #     get '/users/index'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /create' do
  #   it 'returns http success' do
  #     get '/users/create'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /users' do
    it 'return success status' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'title is presente' do
      users = create_list(:user, 3)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe 'POST /users' do
    context 'when it has valid parametes' do
      it 'creates the user with correct attributes' do
        user_attributes = attributes_for(:user)
        post users_path, params: { user: user_attributes }
        expect(User.last).to have_attributes(user_attributes)
      end
    end

    context 'when it has no valid params' do
      it 'does not create the user' do
        expect { post users_path, params: { user: { nickname: '', kind: '', level: '' } } }.not_to change(User, :count)
      end
    end
  end
end
