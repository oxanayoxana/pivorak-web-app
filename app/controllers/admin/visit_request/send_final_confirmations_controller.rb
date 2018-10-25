module Admin
  class VisitRequest
    class SendFinalConfirmationsController < VisitRequest::BaseController
      def create
        Event::SendConfirmations.call(event.visit_requests.final)

        default_redirect
      end
    end
  end
end
