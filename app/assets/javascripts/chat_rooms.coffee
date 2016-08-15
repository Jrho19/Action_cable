# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

  App.global_chat = App.cable.subscriptions.create {
    channel = "ChatRoomsChannel"
    chat_room_id: ''
  },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    receceived: (data) ->
      # Data receceived

    send_message: (message, chat_room_id) ->
      @perform 'send_message', message: message, chat_room_id: chat_room_id

      $('#new_message').submit (e) ->
        $this = $(this)
        text_area = $this.find('#message_body')
        if $.trim(text_area.val()).length > 1
          App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
          textarea.val('')
        e.preventDefault()
        return false
