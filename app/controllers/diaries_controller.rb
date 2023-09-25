class DiariesController < ApplicationController

  def index
    @diaries = Diary.all
  end
  
  def new
    @diary = Diary.new
  end

  def create
    diary.create(diary_params)
  end

  private
  def diary_params
    params.require(:diary).permit(:name, :image, :text)
  end


end
