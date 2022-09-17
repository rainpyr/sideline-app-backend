class RoomChannel < ApplicationCable::Channel

    # The subscribed method gets called once a subscription to the channel is established and it is responsible to setup the stream from which data will be sent back and forth.
    def subscribed
      room = Room.find params[:room]
      stream_for room
  
      # or
      # stream_from "room_#{params[:room]}"
    end
  end