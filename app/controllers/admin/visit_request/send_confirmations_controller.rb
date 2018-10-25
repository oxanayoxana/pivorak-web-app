module Admin
  class VisitRequest
    class SendConfirmationsController < VisitRequest::BaseController
      def new
        render 'admin/visit_requests/send_confirmations/new'
      end

      def create
        Event::SendConfirmations.call(visit_requests)

        default_redirect
      end
    end
  end
end
