module MultibancoIfthenpay
  # Multibanco reference calculation formula
  class Calculator
    CHK_ARRAY = [3, 30, 9, 90, 27, 76, 81, 34, 49, 5, 50, 15, 53, 45, 62, 38,
                 89, 17, 73, 51].freeze

    # @param [String] entity
    # @param [String] sub_entity
    # @param [String] order_id
    # @param [Float] order_value
    # @return [String]
    def self.get_multibanco_reference(entity, sub_entity, order_id, order_value)
      order_id = '0000' + order_id

      order_value = format('%.2f', order_value)

      chk_str = get_chk_string(entity, sub_entity, order_id, order_value)

      chk_digits = get_chk_digits(chk_str)

      chk_str[5, 3] + chk_str[8, 3] + chk_str[11, 1] + chk_digits
    end



    # @param [String] entity
    # @param [String] sub_entity
    # @param [String] order_id
    # @param [Float] order_value
    # @return [String]
    def self.get_chk_string(entity, sub_entity, order_id, order_value)
      if sub_entity.length == 1
        # only the 6 order_id right most digits are going to be used
        chk_str = entity + sub_entity + order_id[-6..-1] +
                  format('%08.0f', (order_value.to_f * 100))
      elsif sub_entity.length == 2
        # only the 5 order_id right most digits are going to be used
        chk_str = entity + sub_entity + order_id[-5..-1] +
                  format('%08.0f', (order_value.to_f * 100))
      else
        chk_str = entity + sub_entity + order_id[-4..-1] +
                  format('%08.0f', (order_value.to_f * 100))
      end

      chk_str
    end

    # @param [String] chk_str
    # @return [String]
    def self.get_chk_digits(chk_str)
      chk_val = 0

      chk_array_size = CHK_ARRAY.length

      CHK_ARRAY.each do |chk_item|
        chk_val += (chk_str[chk_array_size - 1].to_i % 10) * chk_item
        chk_array_size -= 1
      end

      chk_val %= 97

      format('%02.0f', (98 - chk_val))
    end
  end
end