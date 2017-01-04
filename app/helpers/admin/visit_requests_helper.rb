module Admin
  module VisitRequestsHelper

    STATUS_CLASS = {
        ::VisitRequest::PENDING => 'bg-info',
        ::VisitRequest::APPROVED => 'bg-success',
        ::VisitRequest::CANCELED => 'bg-danger'
    }

    def visit_request_status_label(status)
      content_tag :div, status,
        class: ['label', STATUS_CLASS[status.to_sym]]
    end

    def admin_approve_visit_request_link(event, visit_request)
      return if visit_request.approved?

      link_to t('visit_requests.approve'),
        admin_event_visit_request_approve_path(event, visit_request),
        method: :put, class: 'btn btn-success'
    end

    def admin_cancel_visit_request_link(event, visit_request)
      return if visit_request.canceled?

      link_to t('visit_requests.cancel'),
        admin_event_visit_request_cancel_path(event, visit_request),
        method: :put, class: 'btn btn-danger'
    end
  end
end