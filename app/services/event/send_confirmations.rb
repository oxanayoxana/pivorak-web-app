class Event
  class SendConfirmations < ApplicationService
    def initialize(visit_requests)
      @visit_requests = visit_requests
    end

    def call
      visit_requests.final.each do |visit_request|
        VisitRequestMailer.confirmation(visit_request).deliver_later
      end
    end

    private

    attr_reader :visit_requests
  end
end
