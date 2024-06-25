class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Performing job with arguments: #{args.inspect}"
  end
end
