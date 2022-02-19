module DccTabbedSheet
  module Helpers
    def version
      # Sheet version, not DCC_Tabbed_Sheet version
      DccTabbedSheet::SHEET_VERSION
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
