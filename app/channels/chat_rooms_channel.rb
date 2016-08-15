class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream from "chat_rooms_params#{params[chat_room_id]}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # process data sent from homepage
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end
end
