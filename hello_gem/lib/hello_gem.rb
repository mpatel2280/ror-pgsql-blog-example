# frozen_string_literal: true

require_relative "hello_gem/version"

module HelloGem
  class Error < StandardError; end
  # Your code goes here...
  def self.hello
    puts "Hello from my gem!"
  end

  def self.hello_from_gem(post)
    # Example functionality
    post.update(title: post.title)
  end

end
