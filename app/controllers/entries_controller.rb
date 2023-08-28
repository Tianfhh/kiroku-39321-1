class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @entries = Entry.all
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


  private

  def entry_params
    params.require(:entry).permit(:user_id, :title, :text, :image)
  end

end
