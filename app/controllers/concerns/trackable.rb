# app/models/concerns/trackable.rb
module Trackable
    def track_change
      puts "Change tracked at #{Time.current}"
    end
end