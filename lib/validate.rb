module Validate
  def validate_name(user_string)
    user_string.size >= 3 && user_string.size <= 20 ? true : false
  end

  def validate_attempt(user_string)
    return false unless user_string.to_i.positive? || user_string.size < 4 || user_string.size > 4

    arr_of_num = user_string.to_i.digits.map { |num| num if (1..6).to_a.include? num }.compact
    arr_of_num.size >= 4 ? (return true) : (return false)
  end
end
