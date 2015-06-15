class RailsRequest
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def run(input)
    params = JSON.parse(input.read).tap do |h|
      h.keys.each do |k|
        h[k.to_sym] = h.delete(k)
      end
    end

    rack_env = {
      "action_dispatch.request.path_parameters" => params,
      "REQUEST_METHOD" => "GET",
      "rack.input" => ""
    }

    rack_response = app.call(rack_env)
    puts "HTTP response code: #{rack_response[0]}"
    puts "HTTP response headers: #{rack_response[1]}"
    puts "HTTP response body:\n#{rack_response[2].each.inject("", &:<<)}"
  rescue => e
    puts "#{e.class}: #{e.message}"
    puts e.backtrace.join("\n  ")
  end

end

