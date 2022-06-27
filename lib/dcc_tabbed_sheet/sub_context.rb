require 'active_support/core_ext/module/delegation'

# Responsible for generating attribute names and references for melee/ranged weapons (which have different name_prefixes and suffixes, depending on the tab)
#
# Ie: level1 tab: attr_meleeWeaponName, attr_rangedWeaponName
#     level0+   : attr_level0multi_meleeWeaponName1, attr_level0multi_rangedWeaponName1
#                 attr_level0multi_meleeWeaponName2, attr_level0multi_rangedWeaponName2
module DccTabbedSheet
  class SubContext
    attr_accessor :prefix, :name_prefix, :parent_context, :suffix, :template

    def initialize(parent_context:, prefix: "attr_", name_prefix: nil, suffix: nil, template:)
      @parent_context = parent_context
      @prefix = prefix
      @name_prefix = name_prefix
      @suffix = suffix
      @template = template
    end

    def attr(attr_name, include_name_prefix: true)
      [prefix, namespace, include_name_prefix ? name_prefix : nil, attr_name, suffix].compact.join('')
    end

    def attr_ref(attr_name, include_name_prefix: true)
      [namespace, include_name_prefix ? name_prefix : nil, attr_name, suffix].compact.join('')
    end

    # Used to access attributes that aren't part of this context
    # (ie. luckStartingMod, which lives on the character level, rather than the
    # weapon level)
    def parent_attr(attr_name)
      parent_context.attr attr_name
    end

    # Used to access attributes that aren't part of this context
    # (ie. luckStartingMod, which lives on the character level, rather than the
    # weapon level)
    def parent_attr_ref(attr_name)
      parent_context.attr_ref attr_name
    end

    delegate :namespace, :character_name_attr, to: :parent_context
  end
end
