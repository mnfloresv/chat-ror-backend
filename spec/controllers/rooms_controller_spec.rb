require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, :params => {:name => "Test room" } , :format => :json
      expect(response).to be_successful
    end
  end

end
