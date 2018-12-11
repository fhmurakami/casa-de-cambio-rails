class Transaction < ApplicationRecord
  def translate(word)
    return 'Dólar' if word == 'dollar'
    return 'Real' if word == 'real'
    return 'Venda' if word == 'sell'
    'Compra'
  end

  def total(transaction)
    if transaction.currency == 'dollar'
      return format('%.2f', -transaction.amount) if transaction.transaction_type == 'sell'

      format('%.2f', transaction.amount)
    else
      dollar_amount = convert_to_dollar(transaction.amount, transaction.quotation)
      return format('%.2f', -dollar_amount) if transaction.transaction_type == 'sell'

      format('%.2f', dollar_amount)
    end
  end

  def convert_to_dollar(real_amount, quotation)
    real_amount / quotation
  end
end
