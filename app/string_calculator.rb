class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    replace_delimiter(numbers)
    validate_input(numbers)

    numbers.split(',').map(&:to_i).sum { |num| num <= 1000 ? num : 0 }
  end

  private

  def replace_delimiter(numbers)
    delimiter = numbers.match(/^\/\/(.*?)\n/) { $1 }

    unless delimiter.nil?
      numbers.gsub!("//#{delimiter}\n", '')
      delimiter.gsub!('[','')
      delimiters = delimiter.split(']')
      delimiters.map { |d| numbers.gsub!(d, ',') }
    end

    numbers.gsub!('\n', ',')
  end

  def validate_input(numbers)
    digits_count = numbers.scan(/\d+/).size
    raise StandardError, 'invalid input' if digits_count <= numbers.count(',')

    if (negatives = numbers.scan(/-\d+/)).any?
      raise StandardError, "negative numbers are not allowed #{negatives.join(', ')}"
    end
  end
end
