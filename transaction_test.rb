$LOAD_PATH << File.dirname(__FILE__)

require 'minitest/autorun'
require 'transaction'

class ParsingSingleTransactionWithDateTest < MiniTest::Test
  def setup
    single_transaction_with_date = <<EndTransaction
08 Feb 16 ))) INT'L 1234567890
MERCHANT NAME
LOCATION
NZD 37.96 @2.1434
Visa Rate 17.71
EndTransaction
    @transaction = Transaction.parse(single_transaction_with_date)
  end

  def test_should_parse_date
    assert_equal "08 Feb 16", @transaction.date
  end

  def test_should_parse_type
    assert_equal ")))", @transaction.type
  end

  def test_should_parse_name
    assert_equal "INT'L 1234567890", @transaction.name
  end

  def test_should_parse_amount
    assert_equal -17.71, @transaction.amount
  end

  def test_should_parse_memo
    assert_equal "MERCHANT NAME LOCATION NZD 37.96 @2.1434 Visa Rate", @transaction.memo
  end
end
