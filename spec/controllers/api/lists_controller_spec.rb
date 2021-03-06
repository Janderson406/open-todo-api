require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  before do
    @user = create(:user)
  end

  describe "POST create" do

    it "disallows without authentication" do
      post :create, :user_id => @user.id, list: { name: "List Name"}
      expect(response).to have_http_status(401)
    end

    it "creates a new List with authentication" do
      allow(controller).to receive(:authenticated?)
      post :create, :user_id => @user.id, list: { name: "List Name"}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "DELETE destroy" do
    before do
      @list = create(:list)
    end

    it "deletes a List with authentication" do
      allow(controller).to receive(:authenticated?)
      delete :destroy, :user_id => @user.id, id: @list.id
      expect(response).to have_http_status(204)
      expect(response.content_type).to eq("application/json")
    end
  end
end
