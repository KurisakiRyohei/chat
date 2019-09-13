class RoomsController < ApplicationController
  def index
    rooms = @current_user.rooms
    json = RoomSerializer.new(rooms)
      .serializable_hash
    render json: json, status: :ok
  end
end