class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @entry = Entry.find(params[:entry_id])
    if @comment.save
      CommentChannel.broadcast_to @entry, { comment: @comment, user: @comment.user }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, entry_id: params[:entry_id])
  end

end
