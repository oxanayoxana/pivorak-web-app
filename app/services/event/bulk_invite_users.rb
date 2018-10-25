class Event
  class BulkInviteUsers < ::ApplicationService
    # 1. finds users by email
    # 2. creates users if not found
    # 2. sends confirmation emails to event
    # sends confirmation email
    # @param emails [String]
    def initialize(params)
      @event = params[:event]
      @emails = params[:emails]
    end

    def call
      emails.join(',').each do |email|
        user = find_user || create_user
      end
    end

    private

    attr_reader :events, :emails
  end
end
