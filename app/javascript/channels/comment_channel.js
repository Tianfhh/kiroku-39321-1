import consumer from "./consumer"

if(location.pathname.match(/\/entries\/\d/)){

  consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
        <div class="comment">
          <p class="comment-user">${data.user.name}： </p>
          <p>${data.comment.text}</p>
        </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-box")
      commentForm.reset();
  }
})

}