# app/services/rabbitmq_publisher_service.rb
class RabbitmqPublisherService
    def self.publish(queue_name, message)
      channel = Rails.application.config.bunny.create_channel
      queue = channel.queue(queue_name, durable: true)
      queue.publish(message, persistent: true)
    ensure
      channel.close
    end
end
  