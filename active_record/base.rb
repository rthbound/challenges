# Close enough to AR for this challenge
module ActiveRecord
  class Base
    include ActiveModel::Model

    def self.create!(attrs)
      self.new(attrs).tap{|u| u.save! }
    end

    def save!
      save || raise("Couldn't save invalid user: #{errors.inspect}")
    end

    def save
      if valid?
        puts "Created #{self.class}: #{inspect}"
        true
      else
        false
      end
    end

    def attributes
      attrs = {}
      %i(email username name).each do |name|
        value = self.send(name)
        attrs[name] = value if value
      end
      attrs
    end

    def inspect
      "#<#{self.class} #{attributes.inspect}>"
    end
  end
end

