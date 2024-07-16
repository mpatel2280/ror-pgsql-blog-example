if defined?(Bullet)
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer = true
    # Bullet configurations for detecting unused eager loading and counter cache
    Bullet.unused_eager_loading_enable = true
    Bullet.counter_cache_enable = true
  end
  