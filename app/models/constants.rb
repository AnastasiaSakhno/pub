require 'symbol_enums'

module Constants
  module Measure
    @@symbols = :KILO, :LITER, :UNIT
    enum *@@symbols

    def self.all
      @@symbols.collect{ |symbol| symbol.to_s }
    end
  end
end