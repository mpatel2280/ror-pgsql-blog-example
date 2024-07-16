# config/initializers/rack_attack.rb
class Rack::Attack
    # Throttle requests to 5 requests per second per IP address
    throttle('req/ip', limit: 5, period: 1.second) do |req|
      req.ip
    end
  
    # Throttle login attempts to 5 requests per 20 minutes per IP address
    throttle('posts/ip', limit: 5, period: 20.minutes) do |req|
      if req.path == '/posts' && req.post?
        req.ip
      end
    end
  
    # Safelist (allow) requests from localhost
    # safelist('allow-localhost') do |req|
    #   '127.0.0.1' == req.ip || '::1' == req.ip
    # end
  
    # Block requests from a specific IP address
    # blacklist('block 1.2.3.4') do |req|
    #   '1.2.3.4' == req.ip
    # end
  
    # Custom response for throttled requests
    self.throttled_response = lambda do |env|
      now = Time.now.utc
      match_data = env['rack.attack.match_data']
  
      body = if match_data[:limit] == 5 && match_data[:period] == 20.minutes
               'You have made too many login attempts. Please try again later.'
             else
               'You have made too many requests. Please try again later.'
             end
  
      [429, { 'Content-Type' => 'text/plain', 'Retry-After' => match_data[:period] - (now - match_data[:epoch_time]).to_i }, [body]]
    end
  end
  