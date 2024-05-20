# This file is used by Rack-based servers to start the application.

# require_relative "config/environment"

# run Rails.application
Rails.application.load_server

myapp = proc do |env|
  message = "It works!\n"
  version = "Ruby %s\n" % RUBY_VERSION
  response = [message, version].join("\n")
  [200, {"Content-Type" => "text/plain"}, [response]]
end

run myapp
