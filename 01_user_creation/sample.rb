# Problem Statement
#
# Finish implementing these Rails model and controller classes.
# An email address is required for a User to be saveable.
# In the controller, make sure that not just email, but also name
# and username are saved in the new User record.

class User < ActiveRecord::Base
  # Users should not be saveable unless they have an email address
end

class UsersController < ActionController::Base
  def create
    # Create a new user and save it to the database. Be sure to save the
    # user's email address, name, and username (if they are present).
    render text: "You're signed up!"
  end
end

