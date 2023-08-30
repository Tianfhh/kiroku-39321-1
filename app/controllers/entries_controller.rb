class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.includes(:likes).order("created_at DESC")
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = @entry.user
    @comments = @entry.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if user_signed_in? && @entry.user == current_user

    else
      redirect_to root_path
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_path(@entry)
    else
      render :edit
    end
  end

  def destroy
    if @entry.user == current_user
      @entry.destroy
     redirect_to root_path
   else
     redirect_to root_path
   end
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id, :title, :text, :image)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end

end
