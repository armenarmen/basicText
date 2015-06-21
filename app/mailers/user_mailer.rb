class UserMailer < ApplicationMailer

  def welcome_email(user)
    puts ">>>>>>>>>>>>>>>>>>>> welcome email"
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def entries_email(user)
    puts ">>>>>>>>>>>>>>>>>>>> entries email >>>>>>>"
    @user = user
    @entries = @user.where("DATE(created_at) = ?", Time.now-1.day)
    if @entries.present?
      puts "there were some here"
      mail(to: @user.email, subject: 'Your Writings from yesterday!')
    else
      puts "no mails bro"
    end
  end

end
