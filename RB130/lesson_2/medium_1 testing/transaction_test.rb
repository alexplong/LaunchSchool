require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    input = StringIO.new('30')
    output = StringIO.new

    transaction = Transaction.new(25)
    transaction.prompt_for_payment(input: input, output: output)

    assert_equal 30, transaction.amount_paid
  end

end