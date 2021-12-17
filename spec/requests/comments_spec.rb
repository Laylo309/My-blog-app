require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /comments' do
    it 'returns http success' do
      get '/comments/comments'
      expect(response).to have_http_status(:success)
    end
  end
end
