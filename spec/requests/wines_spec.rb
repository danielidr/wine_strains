require 'rails_helper'

RSpec.describe "Wines", type: :request do
  describe "GET /index" do
    it "assigns @wines" do
      Wine.last.delete
      @user = User.create(email: "ed@gmail.com", password: "123456")
      sign_in @user
      wine = Wine.create(name: "Test wine")
      get "/wines"
      expect(assigns(:wines)).to eq([wine])
    end

    it "renders the index template" do
      @user = User.create(email: "ed@gmail.com", password: "123456")
      sign_in @user
      get "/wines"
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders the show template" do
      @user = User.create(email: "ed@gmail.com", password: "123456")
      sign_in @user
      wine = Wine.create(name: "Test wine")
      get "/wines/#{wine.id}"
      expect(response).to render_template(:show)
    end
  end
end
