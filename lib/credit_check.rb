class CardNumber
  @verify = []

  def card
    @card_number = "4929735477250543"
    card_array = @card_number.chars
  end

  def split_even
    card.values_at(0, 2, 4, 6, 8, 10, 12, 14)
  end

  def split_odd
    card.values_at(1, 3, 5, 7, 9, 11, 13, 15)
  end

  def double_even_values
    doubled = split_even.map do |i|
        x = i.to_i * 2
      end
    return doubled
  end

  def collects_digits_under_ten
    under_ten = double_even_values.collect do |i|
      if i.to_i < 10
        i / 2
      end
    end
    return under_ten.compact!
  end

  def collects_digits_over_ten
   doubled = double_even_values.collect do |i|
      if i.to_i >= 10
        i
      end
    end
    return doubled.compact!
  end

  def add_over_ten
    collects_digits_over_ten.map do |i|
      x = i.to_s
      z = x.split("")
      y = z[0].to_i + z[1].to_i 
    end
  end

  def add_all
    total_values = 0

    split_odd.map do |i|
      i.to_i
      total_values += i.to_i
    end    

    add_over_ten.map do |i|
      total_values += i.to_i
    end

    collects_digits_under_ten.map do |i|
      total_values += i.to_i
    end

    return total_values 
  end

  def valid?
    if add_all % 10 == 0
      puts "Card Number is Valid"
      true
    else
      puts "Card Number is Invalid"
      false
    end
  end
end