require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "Test: Index Method" do
    it "Testing for response status" do
      get :index
      # //expect(response.body).to include(car_parts_path)
      expect(response).to have_http_status(:success)
    end

    it "Testing for Renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "Test: Show Method" do
    it "Testing for response status" do
      get :show, params: { id: 1 }
      expect(response.status).to eq(200)
    end

    it "Testing for Renders the show template" do
      get :show, params: { id: 1 }
      expect(response).to render_template("show")
    end
  end
end
