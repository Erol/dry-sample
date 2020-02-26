class PayloadForCreateTransaction < ApplicationPayload
  attribute :email, Types::String
  attribute :amount, Types::Number

  validates :email, presence: { message: error(:missing_email) }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: error(:invalid_email) }, unless: -> { email.blank? }
  validates :amount, presence: { message: error(:missing_amount) }
  validates :amount, numericality: { message: error(:invalid_amount), greater_than: 0 }, unless: -> { amount.blank? }
end
