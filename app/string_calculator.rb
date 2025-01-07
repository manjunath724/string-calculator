class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    sanitize_input(numbers)
    validate_input(numbers)

    numbers.split(',').map(&:to_i).sum { |num| num <= 1000 ? num : 0 }
  end

  private

  def sanitize_input(numbers)
    delimiter = numbers.slice!(/^\/\/(.*?)\n/)
    substitute_pattern(numbers, delimiter) unless delimiter.nil?
    numbers.gsub!("\n", ',')
  end

  def substitute_pattern(numbers, delimiter)
    delimiters = delimiter.gsub!(/\/\/|\[|\n/, '').split(']')
    delimiters.map { |d| numbers.gsub!(d, ',') }
  end

  def validate_input(numbers)
    digits_count = numbers.scan(/\d+/).size
    raise StandardError, 'invalid input' if digits_count <= numbers.count(',')

    if (negatives = numbers.scan(/-\d+/)).any?
      raise StandardError, "negative numbers are not allowed #{negatives.join(', ')}"
    end
  end
end
