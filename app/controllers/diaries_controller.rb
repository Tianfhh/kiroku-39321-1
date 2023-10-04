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
    @diary = Diary.find(params[:id]) 
    @diary.destroy
    redirect_to diaries_path
  end

  def show
    @diary = Diary.find(params[:id])
    unless @diary.user_id == current_user&.id
      redirect_to root_path
    end
  end

  def edit
    @diary = Diary.find(params[:id])
    if user_signed_in? && @diary.user == current_user
      
    else
      redirect_to root_path
    end
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
    else
      render :edit
    end
  end


  private
  def diary_params
    params.require(:diary).permit(:user_id, :title, :text, :image)
  end


end
