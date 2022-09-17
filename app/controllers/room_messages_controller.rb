class RoomMessagesController < ApplicationController
    
    # reload the room using the room_id parameter  as a hidden field in the form
    before_action :load_entities
  
    def create
      @room_message = RoomMessage.create user: current_user,
                                         room: @room,
                                         message: params.dig(:room_message, :message)
    
        # the line RoomChannel.broadcast_to @room, @room_message which will broadcast to the room’s specific stream the @room_message transformed to json via the to_json method.
        RoomChannel.broadcast_to @room, @room_message
    end
  
    protected
  
    def load_entities
      @room = Room.find params.dig(:room_message, :room_id)
    end

    def as_json(options)
        super(options).merge(user_avatar_url: user.gravatar_url)
      end
  end