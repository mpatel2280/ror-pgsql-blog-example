# app/jobs/post_created_job.rb
class PostCreatedJob
    @queue = :post_created
  
    def self.perform(*args)
      puts "Performing job with arguments: #{args.inspect}"
    end
  end
  