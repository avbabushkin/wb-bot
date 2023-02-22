require 'faraday'

class Connection
  class KeyNotProvidedError < StandardError; end

  # TODO: move to config  
  BASE_URL = 'https://suppliers-stats.wildberries.ru/api/v1'

  def init
    raise KeyNotProvidedError, 'Key must be provided by user' unless WbApp::BASE_PARAMS[:key]
    
    logger = Logger.new  STDOUT
    
    Faraday.new(url: BASE_URL) do |f|
      f.response :json
      f.response :logger, logger
    end
  end

  # def logger
  #   logger = Logger.new STDOUT
  #   logger.level = Logger::DEB
  # end
end
