require 'active_support/concern'

module App
  # We will include this in all apis
  module Defaults
    extend ActiveSupport::Concern

    included do
      format :json
      default_format :json

      content_type :json, 'application/json'

      helpers do
        def permitted_params
          @permitted_params ||= declared(params, include_missing: false)
        end
      end

      logger Logger.new GrapeLogging::MultiIO.new(
        STDOUT,
        File.open(App.root.join('log', 'info.log'), 'a')
      )
    end
  end
end
