class User < ActiveRecord::Base
  validates_presence_of :email, :email_confirmation
  validates_confirmation_of :email
end

class UserMailer < ActionMailer::Base
  def self.welcome_email(user)
    mail(to: user.email, subject: 'Thanks for signing up')
  end
end

class UsersController < ActionController::Base
  def create
    @user = User.create!(params[:user])
    UserMailer.welcome_email(@user).deliver_later
    render text: "You're signed up!"
  end
end
