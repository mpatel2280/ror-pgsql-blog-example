# app/services/log_service.rb
class LogService
  def initialize(logger = Rails.logger)
    @logger = logger
  end

  def info(message, tags = [])
    log(:info, message, tags)
  end

  def error(message, tags = [])
    log(:error, message, tags)
  end

  def warn(message, tags = [])
    log(:warn, message, tags)
  end

  def debug(message, tags = [])
    log(:debug, message, tags)
  end

  private

  def log(level, message, tags)
    formatted_message = format_message(message, tags)
    @logger.send(level, formatted_message)
  end

  def format_message(message, tags)
    formatted_tags = tags.map { |tag| "[#{tag}]" }.join(" ")
    "#{formatted_tags} #{message}"
  end
end
