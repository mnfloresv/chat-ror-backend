class RoomsController < ApplicationController
  def index
    @rooms = Room.only(:id, :name)
    render json: @rooms
  end

  def create
    @room = Room.new(name: params[:name])

    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def last_messages
    @room = Room.find(params[:id])
    render json: @room.messages.last(20)
  end
end
