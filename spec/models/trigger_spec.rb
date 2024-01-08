# spec/models/trigger_spec.rb
require 'rails_helper'

RSpec.describe Trigger, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:to) }

    it { should validate_length_of(:body).is_at_least(1).is_at_most(1600) }
    it { should validate_numericality_of(:to) }
    it { should validate_length_of(:to).is_at_least(10).is_at_most(15) }
  end

  describe 'before_create callback' do
    it 'sends notification successfully' do
      trigger = build(:trigger)
      allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages, :create)

      expect { trigger.save }.to_not raise_error
    end

    it 'handles Twilio error' do
      trigger = build(:trigger)
      allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages,
                                                                           :create).and_raise(Twilio::REST::TwilioError.new('Twilio error message'))

      expect { trigger.save! }.to raise_error(Twilio::REST::TwilioError)
      expect(trigger).not_to be_persisted
      expect(trigger.errors[:base]).to include('Twilio error: Twilio error message')
    end

    it 'handles other errors' do
      trigger = build(:trigger)
      allow_any_instance_of(Twilio::REST::Client).to receive_message_chain(:messages,
                                                                           :create).and_raise(StandardError.new('Some error message'))

      expect { trigger.save }.to raise_error(StandardError)
      expect(trigger).not_to be_persisted
      expect(trigger.errors[:base]).to include('Twilio error: Some error message')
    end
  end
end
