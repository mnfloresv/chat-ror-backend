class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Broadcast message via websocket
    ActionCable.server.broadcast("room_#{params[:id]}", data)
    
    # And save the message in DB
    new_msg = Message.new(author: data["author"], text: data["text"])
    Room.find(params[:id]).messages << new_msg
  end
end
