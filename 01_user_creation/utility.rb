require "bundler/setup"
require "action_controller"
require "active_model"

require "../active_record/base"
require "../rails_request"

class User < ActiveRecord::Base
  attr_accessor :email, :username, :name
end

class Order < ActiveRecord::Base
  attr_accessor :user
end

if false
  require "./sample"
  input = STDIN
else
  require "./solution"
  input = StringIO.new(JSON.dump(
    :controller => "user",
    :action => "create",
    :user => {
      :email => "alice@example.com",
      :name => "Alice Example",
      :username => "alice"
    }
  ))
end

RailsRequest.new(UsersController).run(input)
