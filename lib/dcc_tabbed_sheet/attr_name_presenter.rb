module DccTabbedSheet
  class AttrNamePresenter

    attr_accessor :prefix, :name_prefix, :suffix, :template

    def initialize(prefix: "attr_", name_prefix: nil, suffix: nil, template:)
      @prefix = prefix
      @name_prefix = name_prefix
      @suffix = suffix
      @template = template
    end

    def name(attr_name, include_name_prefix: true)
      [prefix, include_name_prefix ? name_prefix : nil, attr_name, suffix].compact.join('')
    end

    def roll(attr_name, include_name_prefix: true)
      [include_name_prefix ? name_prefix : nil, attr_name, suffix].compact.join('')
    end
  end
end
