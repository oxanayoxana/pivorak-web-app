class Event
  class SendConfirmations < ApplicationService
    def initialize(event)
      @event = event
    end

    def call
      Event::SendConfirmations.call()
    end

    private

    attr_reader :event
  end
end
