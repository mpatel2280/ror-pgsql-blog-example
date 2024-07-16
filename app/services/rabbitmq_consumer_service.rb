# app/services/rabbitmq_consumer_service.rb
class RabbitmqConsumerService
  def self.subscribe(queue_name)
    channel = Rails.application.config.bunny.create_channel
    queue = channel.queue(queue_name, durable: true)

    queue.subscribe(manual_ack: true) do |delivery_info, _properties, body|
      puts "Received message::::::::: #{body}"
      
      # Acknowledge the message
      channel.ack(delivery_info.delivery_tag)    
    end
  end
end
