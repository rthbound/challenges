module ActionMailer
  class Base
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def self.mail(args)
      new(args)
    end

    def deliver_later
      puts "Mail sent: #{inspect}"
    end

    def inspect
      "#<#{self.class} #{args.inspect}>"
    end
  end
end