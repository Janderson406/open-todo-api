require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "Users#index returns full list of Users" do

    it "disallows without authentication" do
      get :index
      expect(response).to have_http_status(401)
    end

    it 'returns successfully with authentication' do
      allow(controller).to receive(:authenticated?).and_return(true)
      get :index
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
