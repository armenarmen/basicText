class VisitorsController < ApplicationController
  include SessionsHelper
  def index
    @user = @current_user || User.new(email: "#{(0...8).map { (65 + rand(26)).chr }.join}@example.com",
                                      password: "example1",
                                      password_confirmation: "example1")
    @user.save!
    # log_in @user # this is probably bad
    @entry = @user.entries.build
    puts ">>>>>>>>>> #{@user.id}"
  end
end
