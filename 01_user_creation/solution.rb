class User < ActiveRecord::Base
  validates_presence_of :email
end

class UsersController < ActionController::Base
  def create
    User.create!(params[:user])
    render text: "You're signed up!"
  end
end
