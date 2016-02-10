'use strict'

// initialize Hoodie
var hoodie  = new Hoodie();

var messageStore = hoodie.store('message');

var chatForm = $('[data-action="chat-input"]');
var chatBox = $('[data-action="send-message"]');
var chatStream = $('[data-action="chat-stream"]')

chatForm.on('submit', sendMessage);
chatBox.on('keydown', checkSubmit);

function checkSubmit(e) {
  if(e.keyCode === 13) {
    sendMessage(e);
  }
}

function sendMessage(e) {
  e.preventDefault();

  var messageContent = chatBox.val().trim();
  if(messageContent.length < 1) { return false; }

  var message = new messageModel(messageContent);

  messageStore.add(message).publish();
  hoodie.remote.push();

  chatBox.val('');

  function messageModel(message) {
    var user = hoodie.account.username;
    var postDate = new Date();

    return {
      'user': user,
      'date': postDate,
      'message': message
    };
  }

  hoodie.global.on('add', streamMessage);

  function streamMessage(message) {
    if (message.type !== 'message') { return; }
    var date = new Date(message.date);

    var messageTemplate = $('<div></div>');
    var messageContentContainer = $('<div></div>');
    var messageContent = $('<h6>'+message.user+'</h6>'+
                           '<span>'+date.toLocaleTimeString()+'</span>'+
                           '<p>'+message.message+'</p>');

    messageContentContainer.append(messageContent);
    messageTemplate.append(messageContentContainer);
    messageTemplate.appendTo(chatStream);
  }

}
