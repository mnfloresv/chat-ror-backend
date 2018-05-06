require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room1) { Room.new(name: "Room 1") }
  let(:msg1) { Message.new(author: "Testman", text: "Hello") }
  let(:msg2) { Message.new(author: "Testman", text: "Bye") }

  it "is valid with valid attributes" do
    expect(room1).to be_valid
  end

  it "is not valid without a name" do
    room = Room.new(name: nil)
    expect(room).to_not be_valid
  end

  it "is not valid with empty name" do
    room = Room.new(name: "")
    expect(room).to_not be_valid
  end

  it "has no messages when created" do
    expect(room1.messages).to be_empty
  end

  it "has one message when first message is added" do
    room1.messages.push(msg1)
    expect(room1.messages.length).to be_eql(1)
    expect(room1.messages.first.author).to be_eql(msg1.author)
  end

  it "has two messages and last message is the last added when two messages are added" do
    room1.messages.push(msg1)
    room1.messages.push(msg2)
    expect(room1.messages.length).to be_eql(2)
    expect(room1.messages.last.text).to be_eql(msg2.text)
  end

end
