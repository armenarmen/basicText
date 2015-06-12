class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def entries_email(user)
    @user = user
    @entries = @user.entries.group_by { |stuff| stuff.created_at.to_date }[Date.yesterday]
    # Entry.where(user_id: 104).group_by { |stuff| stuff.created_at.to_date }
    # if entries != 0; send the mail.
    # build the fucking views, loop over. 
  end

end
