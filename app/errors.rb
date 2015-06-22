module App
  # Base for all errors
  class Error < StandardError
    def initialize(msg = nil)
      super(msg || default_msg)
    end

    def code
      self.class.const_get(:CODE)
    end

    private

      def default_msg
        self.class.name[/[^:]+$/].gsub(/([a-z\d])([A-Z])/, '\1 \2')
      end
  end

  # Routing errors
  class NotFound < App::Error; CODE = 404; end

  # Parameter errors
  class InvalidRequest < App::Error; CODE = 406; end

  # Catch-all
  class InternalServerError < App::Error; CODE = 500; end
end
