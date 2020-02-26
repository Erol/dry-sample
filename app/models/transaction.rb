class Transaction < ApplicationRecord
  belongs_to :user

  before_save :generate_digest

  def generate_digest
    threshold = 10
    timestamp = ActiveRecord::Base.connection.execute('SELECT UNIX_TIMESTAMP()').first.first

    raw = [
      user.email,
      amount
    ].join('|')
    raw << "|#{timestamp / threshold}"

    self.digest = Digest::SHA256.hexdigest(raw)
  end
end
