require 'rails_helper'

describe Event::BulkInviteUsers do
  subject(:service) { described_class.new(event: event, emails: emails) }

  let(:event) { create(:event) }
  let(:emails) { '' }

  describe '#call' do
    context 'when there is no users with given email' do
      let(:emails) { 'ivan@mail.com, petro@email.com' }

      it 'creates 2 users' do
        service.call

        expect(User.count(email: ['ivan@mail.com', 'petro@email.com'])).to eq(2)
      end

      it 'sends confirmations to 2 users' do
        service.call

        expect(active_jobs.size).to eq(2)

        expect(active_job[:job]).to eq ActionMailer::DeliveryJob
        expect(active_job[:args][0]).to eq 'VisitRequestMailer'
        expect(active_job[:args][1]).to eq 'needs_confirmation'
      end
    end

    context 'when there are users with given email' do
      let(:emails) { 'ivan@mail.com, petro@email.com' }
      before do
        create(:user, email: 'ivan@mail.com')
        create(:user, email: 'petro@email.com')
      end


    end
  end
end
