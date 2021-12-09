require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before :each do
      get '/users'
    end
    it "should return :ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:index)
    end

    it "should render correct placeholder text" do
      expect(response.body).to include('User created successfully!')
    end

    it "should not render invalid placeholder text" do
      expect(response.body).to_not render_template(:show)
    end
  end

  describe "GET /show" do
    before :each do
      get '/users/user_id'
    end

    it "should return :ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:show)
    end
      it "should render correct placeholder text" do
        expect(response.body).to include('User Profile')

    end

    it "should not render invalid placeholder text" do
      expect(response.body).to_not render_template(:index)
    end
  end
end
