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

  describe "GET #last_messages" do
    it "returns only last 20 messages" do
      room = Room.create(name: "Test room 2")
      30.times do
        msg = Message.new(author: "Testman", text: "Test message")
        room.messages.push(msg)
      end
      get :last_messages, :params => {:id => room.id}
      json = JSON(response.body)
      expect(json.length).to be_eql(20)
    end
  end
end
