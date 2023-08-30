class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry

  def create
    like = current_user.likes.build(entry_id: params[:entry_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(entry_id: params[:entry_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

end
