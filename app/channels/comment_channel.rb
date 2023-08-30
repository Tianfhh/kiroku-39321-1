class CommentChannel < ApplicationCable::Channel
  def subscribed
    @entry = Entry.find(params[:entry_id])
    stream_for @entry
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
