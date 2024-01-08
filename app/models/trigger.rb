# frozen_string_literal: true

class Trigger < ApplicationRecord
  validates :body, :to, presence: true
  validates :body, length: { in: 1..1600 } # Twilio recommendation
  validates :to,   presence: { message: 'Phone number is invalid!' },
                   numericality: true,
                   length: { minimum: 10, maximum: 15 }

  before_create :send_notification

  private

  def send_notification
    # Use Twilio to send SMS
    client = Twilio::REST::Client.new
    client.messages.create(body:, from: ENV['TWILIO_PHONE_NUMBER'], to:)
  rescue Twilio::REST::TwilioError, StandardError => e
    error = "Twilio error: #{e.message}"
    errors.add(:base, error)
    Rails.logger.error(error)
    raise e
  end
end
