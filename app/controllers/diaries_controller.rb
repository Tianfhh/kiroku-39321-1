class DiariesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user_diaries = current_user.diaries.order(created_at: :DESC)
  end
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params) 
    @diary.user = current_user

    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def destroy
    diary = diary.find(params[:id])
    diary.destroy
    redirect_to diaries_path
  end

  private
  def diary_params
    params.require(:diary).permit(:user_id, :title, :text, :image)
  end


end
