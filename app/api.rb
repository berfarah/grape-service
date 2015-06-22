require 'errors'

module App
  # Central API
  class Api < Grape::API
    include ::App::Defaults

    # logger.formatter = GrapeLogging::Formatters::Default.new
    # use GrapeLogging::Middleware::RequestLogger, logger: logger

    rescue_from App::Error, App::NotFound do |e|
      # ::App.logger.error e
      error_response(message: e.message, status: e.code)
    end

    rescue_from :all do |e|
      # ::App.logger.error e
      error_response(message: e.message, backtrace: e.backtrace, status: e.code)
    end

    # Mount endpoints (from /api) eg:
    # mount App::Resource

    # Catches remaining paths for 404 error
    route(:any, '*path') { fail App::NotFound }
  end
end
