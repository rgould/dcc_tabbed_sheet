# Responsible for context-related decisions
#
# For example, normally we use @{character_name} for the name in templates,
# but for multi-level0s, we use @{name}
#
module DccTabbedSheet
  class TabContext

    attr_reader :character_name_attr, :namespace, :template

    def initialize(character_name_attr: "character_name", namespace: nil, template:)
      @character_name_attr = character_name_attr
      @namespace = namespace
      @template = template
    end

    def attr(attr_name)
      # Used to declare an attr name, in an input for example. ie: name="attr_name"
      ["attr_", namespace, attr_name].compact.join('')
    end

    def attr_ref(attr_name)
      # Used in rolls for example, to reference an attribute, ie: @{str}
      [namespace, attr_name].compact.join('')
    end

  end
end
