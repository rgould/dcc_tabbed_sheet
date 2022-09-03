module DccTabbedSheet
  module Helpers
    def version
      # Sheet version, not DCC_Tabbed_Sheet version
      DccTabbedSheet::SHEET_VERSION
    end

    def present_attr_name(name_prefix: nil, suffix: nil)
      presenter = AttrNamePresenter.new(name_prefix: name_prefix, suffix: suffix, template: self)
      yield presenter if block_given?
      presenter
    end

    def with_context(character_name_attr: nil, namespace: "")
      tab_context = TabContext.new(character_name_attr: character_name_attr, namespace: namespace, template: self)
      yield tab_context if block_given?
      tab_context
    end

    def with_scoped_subcontext(parent_context:, name_prefix: nil, suffix: nil)
      tab_context = SubContext.new(parent_context: parent_context,
                                   name_prefix: name_prefix,
                                   suffix: suffix,
                                   template: self)
      yield tab_context if block_given?
      tab_context
    end

    def luck_score_data
      DccData::LuckScore.new.entries
    end

    def default_context
      @default_context ||= TabContext.new(template: nil)
      @default_context
    end

    def new_tag(title)
      tag.span "❗", class: "sheet-new-feature sheet-new-tag", title: title
    end

    def die_selector(attr_name:, classes: "", default: 20, dice: DccData::DiceChain::DCC_DICE_CHAIN)
      select_tag(attr_name, options_for_select(dice.map{|d| "d#{d}"}, "d#{default}"), id: nil, class: classes)
    end

    def option_toggle(option_name, title: "")
      unless DccTabbedSheet::SheetOptions::OPTIONS.include?(option_name.to_sym)
        raise "Option #{option_name} missing from DccTabbedSheet::SheetOptions::OPTIONS"
      end
      check_box_tag("attr_options_#{option_name}", "1", false, { title: title })
    end

    def hidden_option(option_name, classes:"", &block)
      unless DccTabbedSheet::SheetOptions::OPTIONS.include?(option_name.to_sym)
        raise "Option #{option_name} missing from DccTabbedSheet::SheetOptions::OPTIONS"
      end
      if block_given?
        subcontent = capture(&block).html_safe
        [
          hidden_field_tag("attr_options_#{option_name}"),
          tag.div(subcontent, class: [classes, option_class_name(option_name)].join(" "))
        ].join("\n")
      else
        hidden_field_tag("attr_options_#{option_name}")
      end.html_safe
    end

    def option_class_name(option_name, inline: false)
      unless DccTabbedSheet::SheetOptions::OPTIONS.include?(option_name.to_sym)
        raise "Option #{option_name} missing from DccTabbedSheet::SheetOptions::OPTIONS"
      end
      _class = "sheet-option-#{option_name}"
      if inline
        suffix = inline ? "-inline" : ""
        "#{_class} #{_class}#{suffix}"
      else
        _class
      end
    end

    def feature_lankhmar?
      false
    end

    def level0multi_namespace
      # All attribute names and references in the level0 repeating section will be prefixed with this value
      "level0multi_"
    end

    def level0multi_melee_weapon_count
      3
    end

    def level0multi_ranged_weapon_count
      3
    end

    def abilities_attribute_names
      %w(str agi sta per int luck luckstarting)
    end

    def autoupdate_attribute(source:, dest:, repeating_section: nil)
      event_selector = if repeating_section.present?
                         "change:repeating_#{repeating_section}:#{source}"
                       else
                         "change:#{source}"
                       end
      <<~JS.html_safe
        on("#{event_selector}", function(e) {
          var attr = e.sourceAttribute;
          var targetAttr = attr.replace("#{source}", "#{dest}");
          getAttrs([targetAttr], function(values) {
            if (!values[targetAttr]) {
              setAttrs({
                [targetAttr]: e.newValue
              });
            }
          });
        });
      JS
    end

    def comparison_function(key, lower, upper)
      raise "invalid" unless upper || lower
      if upper && lower
        "rollBetween() #{key} #{lower} #{upper}"
      elsif upper
        "rollLess() #{key} #{upper+1}"
      else
        "rollGreater() #{key} #{lower-1}"
      end
    end

    # only includes attributes that have differing names
    def map_other_sheet_to_this_sheet
      {
        ActionDice1: :ActionDie,
        ActionDice2: :ActionDie2,
        Agility: :agi,
        Agility_max: :agiMax,
        BardCalltoArms: :callToArmsCheckMisc,
        BardCalm: :calmCheckMisc,
        BardChallenge: :challengeCheckMisc,
        BardLore: :loreCheckMisc,
        BardSpell: :spellName,
        BardSpellCheckMisc: :arcaneMod,
        BardSpellLevel: :spellLevel,
        BardSpellMercurial: :spellMercurialMagic,
        ClericDisapproval: :disapproval,
        ClericSpell: :spellNameCleric,
        ClericSpellCheckMisc: :divineMod,
        ClericSpellLevel: :spellLevel,
        ClericSpellNotes: :spellDescriptionCleric,
        ElfSpell: :spellName,
        ElfSpellCheckMisc: :arcaneMod,
        ElfSpellLevel: :spellLevel,
        ElfSpellNotes: :spellMercurialMagic,
        GnomeSpell: :spellName,
        GnomeSpellCheckMisc: :arcaneMod,
        GnomeSpellLevel: :spellLevel,
        GnomeSpellMercurial: :spellMercurialMagic,
        Intelligence: :int,
        Intelligence_max: :intMax,
        Level_max: :className,
        Luck_max: :luckMax,
        PaladinSpell: :spellNameCleric,
        PaladinSpellCheckMisc: :divineMod,
        PaladinSpellLevel: :spellLevel,
        PaladinSpellNotes: :spellDescriptionCleric,
        Personality: :per,
        Personality_max: :perMax,
        RangerClimb: :rangerClimbCheckMisc,
        RangerSneak: :rangerSneakCheckMisc,
        RangerStrider: :rangerStriderCheckMisc,
        RangerSurvival: :rangerSurvivalCheckMisc,
        RangerTraps: :rangerFindTrapsCheckMisc,
        Stamina: :sta,
        Stamina_max: :staMax,
        Strength: :str,
        Strength_max: :strMax,
        WeaponAtk: :OtherToHitBonus, # prefixed with melee or ranged
        WeaponDmg: :Dmg, # prefixed with melee or ranged
        WeaponName: :WeaponName, # prefixed with melee or ranged
        WeaponSpecial: :WeaponSpecial, # prefixed with melee or ranged
        WizardSpell: :spellName,
        WizardSpellCheckMisc: :arcaneMod,
        WizardSpellLevel: :spellLevel,
        WizardSpellMercurial: :spellMercurialMagic
      }
    end
  end
end
