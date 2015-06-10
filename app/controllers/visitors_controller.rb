class VisitorsController < ApplicationController
  def index
    @user = @current_user || User.new
    @entry = @user.entries.build
  end
end
