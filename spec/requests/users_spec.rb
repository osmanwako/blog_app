require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { User.create(name: 'Osman', bio: 'Lecturer at JIT', photo: '', posts_counter: 0) }

  describe 'Test: Get /users route and Index method' do
    it 'Testing for response status' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'Testing for Renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'Testing for response body includes correct placeholder text' do
      get user_posts_path(user)
      expect(response.body).to include('Osman')
      expect(response.body).to include('Number of post')
    end
  end
  describe 'Test: Get /users/:id route and Show method' do
    it 'Testing for response status' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'Testing for Renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'Testing for response body includes correct placeholder text' do
      get user_posts_path(user)
      expect(response.body).to include('Osman')
      expect(response.body).to include('Number of post')
    end
  end
end
