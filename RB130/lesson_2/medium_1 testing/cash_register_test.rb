require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(100)
    transaction.amount_paid = 100

    prev_amount = register.total_money
    register.accept_money(transaction)
    curr_amount = register.total_money

    assert_equal(prev_amount + 100, curr_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(80)

    transaction.amount_paid = 100

    assert_equal 20, register.change(transaction)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    transaction = Transaction.new(80)

    output = "You've paid $80.\n"

    assert_output(output) { register.give_receipt(transaction) }
  end


end