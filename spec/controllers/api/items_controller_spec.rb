require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  before do
    @list = create(:list)
  end

  describe "POST create" do

    it "disallows without authentication" do
      post :create, :list_id => @list.id, item: { description: "Item Description"}
      expect(response).to have_http_status(401)
    end

    it "creates a new Item with authentication" do
      allow(controller).to receive(:authenticated?)
      post :create, :list_id => @list.id, item: { description: "Item Description"}
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end
end
