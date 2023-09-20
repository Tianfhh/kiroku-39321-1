class DiariesController < ApplicationController

  def index
    @entries = Entry.includes(:likes).order("created_at DESC")
  end
  
end
