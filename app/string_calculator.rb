class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.gsub!('\n', ',')

    validate_size(numbers)
    validate_negative(numbers)

    numbers.split(',').map(&:to_i).sum { |num| num <= 1000 ? num : 0 }
  end

  private

  def validate_size(numbers)
    digits_count = numbers.scan(/\d+/).size
    raise StandardError, 'invalid input' if digits_count <= numbers.count(',')
  end

  def validate_negative(numbers)
    negative_digits = numbers.scan(/-\d+/)
    raise StandardError.new("negative numbers are not allowed #{negative_digits.join(', ')}") unless negative_digits.empty?
  end
end
