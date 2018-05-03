require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:msg1) { Message.new(author: "Testman", text: "Hello") }

  it "is valid with valid attributes" do
    expect(msg1).to be_valid
  end
end
