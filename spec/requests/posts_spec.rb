require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    before :each do
      get '/users/user_id/posts'
    end
    it "should return :ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:index)
    end

    it "should render correct placeholder text" do
      expect(response.body).to include('All posts')
    end

    it "should not render invalid placeholder text" do
      expect(response.body).to_not render_template(:show)
    end
  end

  describe "GET /show" do
    before :each do
      get '/users/user_id/posts/id'
    end

    it "should return :ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should render the correct template" do
      expect(response).to render_template(:show)
    end
      it "should render correct placeholder text" do
        expect(response.body).to include('This is a post for users')
    end

    it "should not render invalid placeholder text" do
      expect(response.body).to_not render_template(:index)
    end
  end
end
