require 'multibanco_ifthenpay/version'
require 'multibanco_ifthenpay/calculator'

module MultibancoIfthenpay
  # Multibanco reference generator using Ifthenpay gateway
  class Multibanco
    attr_reader :entity, :order_value

    # @param [String] entity
    # @param [String] sub_entity
    # @param [String] order_id
    # @param [Float] order_value
    def initialize(entity, sub_entity, order_id, order_value)
      validate!(entity, sub_entity, order_value)

      @entity = entity
      @sub_entity = sub_entity
      @order_id = order_id
      @order_value = order_value
    end

    def validate!(entity, sub_entity, order_value)
      raise ArgumentError, 'Not a valid entity' unless entity.length == 5
      raise ArgumentError, 'Not a valid sub-entity' unless
          !sub_entity.empty? && sub_entity.length < 4
      raise ArgumentError, 'Not a valid order value' unless order_value >= 1
    end

    # @param [BooleanMatcher] prettify
    # @return [String]
    def print_multibanco_reference(prettify = false)
      reference = MultibancoIfthenpay::Calculator
                  .get_multibanco_reference(@entity, @sub_entity,
                                            @order_id, @order_value)

      prettify ? reference.scan(/.{3}/).join(' ') : reference
    end
  end
end
