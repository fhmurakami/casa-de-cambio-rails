class Transaction < ApplicationRecord
  belongs_to :user

  validates :amount, :currency, :quotation,
            :transaction_type, presence: true

  sum = 0

  def translate(word)
    return 'Dólar' if word == 'dollar'
    return 'Real' if word == 'real'
    return 'Venda' if word == 'sell'

    'Compra'
  end

  def total(transaction)
    if transaction.currency == 'dollar'
      return -transaction.amount if transaction.transaction_type == 'sell'

      transaction.amount
    else
      dollar_amount = convert_to_dollar(transaction.amount, transaction.quotation)
      return -dollar_amount if transaction.transaction_type == 'sell'

      dollar_amount
    end
  end

  def convert_to_dollar(real_amount, quotation)
    real_amount / quotation
  end
end
