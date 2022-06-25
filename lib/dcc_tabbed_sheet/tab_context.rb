# Responsible for context-related decisions
#
# For example, normally we use @{character_name} for the name in templates,
# but for multi-level0s, we use @{name}
#
module DccTabbedSheet
  class TabContext

    attr_reader :character_name_attr, :template

    def initialize(character_name_attr: "character_name", template:)
      @character_name_attr = character_name_attr
      @template = template
    end

  end
end
