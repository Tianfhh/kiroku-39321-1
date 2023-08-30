import consumer from "./consumer"

if(location.pathname.match(/\/entries\/\d/)){
  console.log("読み込み完了")

  consumer.subscriptions.create("CommentChannel", {
connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
})

}