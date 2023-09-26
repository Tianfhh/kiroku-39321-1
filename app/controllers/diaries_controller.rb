class DiariesController < ApplicationController

  def index
    @diaries = Diary.all
  end
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params) 
    @diary.user = current_user
    if @diary.save
      redirect_to diary_path(@diary)
    else
      render :new
    end

  end

  def destroy
    diary = diary.find(params[:id])
    diary.destroy
  end

  private
  def diary_params
    params.require(:diary).permit(:user_id, :title, :text, :image)
  end


end
