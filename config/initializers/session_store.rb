# config/initializers/session_store.rb

# Store in DB
Rails.application.config.session_store :active_record_store, key: '_my_blog_session'

# Store in File
# Rails.application.config.session_store :file_store, key: '_my_blog_session', expire_after: 30.minutes, path: Rails.root.join('tmp', 'sessions')
