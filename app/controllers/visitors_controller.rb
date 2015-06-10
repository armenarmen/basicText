class VisitorsController < ApplicationController
  def index
    @entry = Entry.new
    @user = @current_user || User.new
  end
end
