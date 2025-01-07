class StringCalculator
  def add(numbers)
    numbers.gsub!('\n', ',')
    numbers.split(',').map(&:to_i).sum
  end
end
