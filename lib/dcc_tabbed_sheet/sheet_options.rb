require 'singleton'

module DccTabbedSheet
  class SheetOptions
    include Singleton

    attr_accessor :registered_options

    def register(option_name)
      @registered_options ||= []
      @registered_options << option_name.to_sym
    end
  end
end
