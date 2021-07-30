require 'rails_helper'

RSpec.describe "Wines", type: :request do
  describe "GET /index" do

    it "assigns @wines" do
      wine = Wine.create(name: "Casillero del diablo")
      get "/wines"
      expect(assigns(:wines)).to eq([wine])
    end

    it "renders the index template" do
      get "/wines"
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do

    it "renders the show template" do
      get "/wines/:id"
      expect(response).to render_template(:show)
    end
  end
end
