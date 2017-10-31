$(document).on 'turbolinks:load', ->
  App.chatroom = App.cable.subscriptions.create({
    channel: 'ChatroomChannel',
    id: $('#messages').attr('data-chatroom-id')
  }, received: (data) ->
    $('messages').append(data.message)
    return
  )
  return
