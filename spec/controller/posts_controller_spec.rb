require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Test: Index method' do
    it 'Testing for response status' do
      get :index, params: { user_id: 1 }
      expect(response).to have_http_status(200)
    end
    it 'Testing for Renders the index template' do
      get :index, params: { user_id: 1 }
      expect(response).to render_template('index')
    end
  end
  describe 'Test: Show Method' do
    it 'Testing for response status' do
      get :show, params: { user_id: 1, id: 1 }
      expect(response).to have_http_status(200)
    end
    it 'Testing for Renders the show template' do
      get :show, params: { user_id: 1, id: 2 }
      expect(response).to render_template('show')
    end
  end
end
