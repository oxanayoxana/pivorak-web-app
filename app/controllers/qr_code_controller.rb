class QrCodeController < ApplicationController
  def show
    visit_request = current_user.visit_requests.last
    qr_code = VisitRequest::QrCode::HTML.call(visit_request)
  end
end
