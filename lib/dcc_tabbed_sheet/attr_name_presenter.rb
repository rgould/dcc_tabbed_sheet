module DccTabbedSheet
  class AttrNamePresenter

    attr_accessor :prefix, :suffix, :template

    def initialize(prefix: "attr_", suffix: nil, template:)
      @prefix = prefix
      @suffix = suffix
      @template = template
    end

    def name(attr_name)
      [prefix, attr_name, suffix].compact.join('')
    end

    def roll(attr_name)
      [attr_name, suffix].compact.join('')
    end
  end
end
