# frozen_string_literal: true

require_relative "hello_gem/version"

module HelloGem
  class Error < StandardError; end
  
  def self.hello_from_gem(post)
    post.update(title: post.title)
  end
end
