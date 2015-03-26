module ActionController
  class InvalidCrossOriginRequest < ActionControllerError
  end

  module RequestForgeryProtection
    module ClassMethods
      def protect_from_forgery(options = {})
        self.request_forgery_protection_token ||= :authenticity_token
        prepend_before_filter :verify_authenticity_token, options
        append_after_filter :verify_same_origin_request
      end
    end

    protected

      def verify_authenticity_token
        @marked_for_same_origin_verification = true

        unless verified_request?
          logger.warn "WARNING: Can't verify CSRF token authenticity" if logger
          handle_unverified_request
        end
      end

      CROSS_ORIGIN_JAVASCRIPT_WARNING = "Security warning: an embedded " \
        "<script> tag on another site requested protected JavaScript. " \
        "If you know what you're doing, go ahead and disable forgery " \
        "protection on this action to permit cross-origin JavaScript embedding."
      private_constant :CROSS_ORIGIN_JAVASCRIPT_WARNING

      # If `verify_authenticity_token` was run (indicating that we have
      # forgery protection enabled for this request) then also verify that
      # we aren't serving an unauthorized cross-origin response.
      def verify_same_origin_request
        if marked_for_same_origin_verification? && non_xhr_javascript_response?
          logger.warn CROSS_ORIGIN_JAVASCRIPT_WARNING if logger
          raise ActionController::InvalidCrossOriginRequest, CROSS_ORIGIN_JAVASCRIPT_WARNING
        end
      end

      # If the `verify_authenticity_token` before_action ran, verify that
      # JavaScript responses are only served to same-origin GET requests.
      def marked_for_same_origin_verification?
        defined? @marked_for_same_origin_verification
      end

      # Check for cross-origin JavaScript responses.
      def non_xhr_javascript_response?
        content_type =~ %r(\Atext/javascript) && !request.xhr?
      end

      def handle_unverified_request
        raise(ActionController::InvalidAuthenticityToken)
      end
  end
end