require 'pathname'

# Globals defined here
module App
  class << self
    def root
      @root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    def env
      @env ||= ENV['RACK_ENV'].to_sym
    end
  end
end
