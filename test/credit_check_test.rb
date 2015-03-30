require_relative 'credit_check_test_helper'
require './lib/credit_check'

class CardNumberTest <Minitest::Test
  def test_it_exists
    assert CardNumber
  end

  def test_it_has_a_card_number_to_verify
    card_number = CardNumber.new
    assert_equal ["4", "9", "2", "9", "7", "3", "5", "4", "7", "7", "2", "5", "0", "5", "4", "3"], card_number.card
  end

  def test_it_pulls_out_even_values
    card_number = CardNumber.new
    assert_equal ["4", "2", "7", "5", "7", "2", "0", "4"], card_number.split_even
  end

  def test_it_pulls_out_odd_values
    card_number = CardNumber.new
    assert_equal ["9", "9", "3", "4", "7", "5", "5", "3"], card_number.split_odd
  end

  def test_it_doubles_even_values    
    card_number = CardNumber.new
    assert_equal [8, 4, 14, 10, 14, 4, 0, 8], card_number.double_even_values
  end

  def test_it_collects_digits_under_ten
    card_number = CardNumber.new
    assert_equal [4, 2, 2, 0, 4], card_number.collects_digits_under_ten
  end

  def test_it_collects_digits_over_ten
    card_number = CardNumber.new
    assert_equal [14, 10, 14], card_number.collects_digits_over_ten 
  end

  def test_it_adds_over_ten_digits 
    card_number = CardNumber.new
    assert_equal [5, 1, 5], card_number.add_over_ten
  end

  def test_it_sums_all_digits
    card_number = CardNumber.new
    assert_equal 68, card_number.add_all
  end

  def test_it_identifies_invalid_card_number
    card_number = CardNumber.new
    assert_equal false, card_number.valid?
  end

end

