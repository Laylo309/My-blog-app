require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "GET /likes" do
    it "returns http success" do
      get "/likes/likes"
      expect(response).to have_http_status(:success)
    end
  end

end
