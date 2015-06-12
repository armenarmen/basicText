class VisitorsController < ApplicationController
  include SessionsHelper
  def index
    if logged_in?
      puts "logged_in = true ----------------"
      @user = @current_user
    else
       @user = User.new(email: "#{(0...8).map { (65 + rand(26)).chr }.join}@example.com",
                                      password: "example1",
                                      password_confirmation: "example1")
       @user.save!

    end
    # @user = @current_user || User.new(email: "#{(0...8).map { (65 + rand(26)).chr }.join}@example.com",
    #                                   password: "example1",
    #                                   password_confirmation: "example1")
    
    puts ">>>>>>>>>>>>>>>>>>>>>>> logged in ? -> #{logged_in?} id = #{@user.id}"
    log_in @user # this is probably bad
    @entry = @user.entries.build
    # puts ">>>>>>>>>> "
  end
end
