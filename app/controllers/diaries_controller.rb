class DiariesController < ApplicationController

  def index
    @diaries = Diary.all
  end
  
  def new
    @diary = Diary.new
  end

end
