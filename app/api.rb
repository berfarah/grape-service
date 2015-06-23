require 'errors'

module App
  # Central API
  class API < Grape::API
    include ::App::Defaults

    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, logger: logger

    rescue_from App::Error do |e|
      error_response(message: e.message, status: e.code)
    end

    rescue_from :all do |e|
      logger.error [e.to_s, e.backtrace].flatten.join("\n")
    end

    # Mount endpoints (from /api) eg:
    # mount App::Resource

    # Catches remaining paths for 404 error
    route(:any, '*path') { fail App::NotFound }
  end
end
