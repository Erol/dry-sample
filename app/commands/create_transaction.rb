class CreateTransaction < ApplicationCommand
  option :payload, type: Types::PayloadForCreateTransaction, reader: :private

  def perform
    Transaction.transaction do
      yield validate_payload
      user = yield find_or_create_user
      transaction = yield create_transaction(user)

      Success(transaction)
    end
  end

  private

  def validate_payload
    if payload.valid?
      Success()
    else
      Failure(errors: payload.errors.messages)
    end
  end

  def find_or_create_user
    user = User.find_or_create_by(email: payload.email)

    Success(user)
  end

  def create_transaction(user)
    transaction = Transaction.create(user: user, amount: payload.amount)

    Success(transaction)

  rescue ActiveRecord::RecordNotUnique
    Failure(errors: { transaction: [I18n.t('api.errors.duplicate_transaction')] })
  end
end
