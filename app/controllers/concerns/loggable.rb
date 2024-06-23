# app/models/concerns/loggable.rb
module Loggable
    def log(message)
      puts "Log: #{message}"
    end
end
  
  
  