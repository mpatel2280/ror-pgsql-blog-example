# app/sweepers/post_sweeper.rb
class PostSweeper < ActionController::Caching::Sweeper
    observe Post
  
    def after_save(post)
      expire_cache_for(post)
    end
  
    def after_destroy(post)
      expire_cache_for(post)
    end
  
    private
  
    def expire_cache_for(post)
      expire_fragment("all_posts")
      expire_fragment("post_#{post.id}")
    end
  end
  