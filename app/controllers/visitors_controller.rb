class VisitorsController < ApplicationController
  include SessionsHelper
  def index
    if logged_in?
      @user = @current_user
    else
       @user = User.new(email: "#{(0...8).map { (65 + rand(26)).chr }.join}@example.com",
                        password: "example1",
                        password_confirmation: "example1")
       @user.save!
    end
    @entry = @user.entries.build
  end
end
