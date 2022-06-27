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


    def default_context
      @default_context ||= TabContext.new(template: nil)
      @default_context
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
