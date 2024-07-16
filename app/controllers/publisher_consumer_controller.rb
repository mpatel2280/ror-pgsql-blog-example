# app/controllers/publisher_consumer_controller.rb
class PublisherConsumerController < ApplicationController
    protect_from_forgery with: :null_session
    def publish
        # Publish a message
        current_time = Time.now
        message = "Current Message time is: #{current_time}"
        RabbitmqPublisherService.publish('my_queue', message)
        render json: { status: 'Message sent' }
    end

    # curl -X POST -d "message=Hello RabbitMQ Via Post " http://localhost:3000/post_message

    def publish_post
        
        # Publish a message (via post method)
        message = params[:message]
        RabbitmqPublisherService.publish('my_queue', message)
        render json: { status: 'Message sent - via post method' }
    end

    def consume
        # Consume messages
        RabbitmqConsumerService.subscribe('my_queue')
        render json: { status: 'Message received' }
    end

    
  end