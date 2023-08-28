class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

end
