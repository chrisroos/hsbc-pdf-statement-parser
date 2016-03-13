class Transaction
  def self.parse(transaction_text)
    transaction = new

    date = transaction_text[/^(\d{2} [A-Z][a-z]{2} \d{2})/, 1]
    transaction_text.sub!(date, '').strip!

    type = transaction_text[/^(\)\)\))/, 1]
    transaction_text.sub!(type, '')

    name = transaction_text.lines.first.strip
    transaction_text.sub!(name, '')

    amount = transaction_text.lines.last[/(\d+\.\d+)$/, 1]
    transaction_text.sub!(amount, '')

    memo = transaction_text.lines.map(&:strip).join(' ').strip

    transaction.date = date
    transaction.type = type
    transaction.name = name
    transaction.memo = memo
    transaction.amount = -Float(amount)

    transaction
  end
  
  attr_accessor :date, :type, :name, :memo, :amount
end
