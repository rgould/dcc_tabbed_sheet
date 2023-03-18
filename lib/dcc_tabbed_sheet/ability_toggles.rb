module DccTabbedSheet
  module AbilityToggles
    BETA_THIEF_SKILLS = %i(
      can_sneak_silently
      can_hide_in_shadows
      can_pick_pockets
      can_climb
      can_pick_lock
      can_find_trap
      can_disable_trap
      can_forge_document
      can_disguise_self
      can_read_languages
      can_handle_poison
    )

    def self.cleric
      {
        can_cast_divine_spells: "Divine Spells",
        can_cast_turn_unholy: "Turn Unholy",
        can_cast_lay_on_hands: "Lay on Hands",
        can_cast_divine_aid: "Divine Aid"
      }
    end

    def self.dwarf
      {
        can_use_mighty_deeds: "Mighty Deeds of Arms",
        has_lucky_weapon: "Lucky Weapon",
        can_shield_bash: "Shield Bash"
      }
    end

    def self.elf
      {
        has_lucky_spell: "Lucky Spell",
        can_cast_wizard_spells: "Wizard Spells",
        can_have_a_familiar: "Familiar",
        can_have_a_patron: "Patron",
        has_heightened_senses: "Heightened Senses"
      }
    end

    def self.halfling
      {
        can_halfling_stealth: "Stealth"
      }
    end

    def self.thief
      {
        can_backstab: "Backstab",
        can_use_luck_die: "Luck Die",
        can_cast_spell_from_scroll: "Cast Spell from Scrolls",
        can_sneak_silently: "Sneak Silently",
        can_hide_in_shadows: "Hide in Shadows",
        can_pick_pockets: "Pick Pockets",
        can_climb: "Climb",
        can_pick_lock: "Pick Locks",
        can_find_trap: "Find Traps",
        can_disable_trap: "Disable Traps",
        can_forge_document: "Forge Documents",
        can_disguise_self: "Disguise Self",
        can_read_languages: "Read Languages",
        can_handle_poison: "Handle Poison"
      }
    end

    def self.warrior
      {
        can_use_mighty_deeds: "Mighty Deeds of Arms",
        has_lucky_weapon: "Lucky Weapon",
        adds_level_to_init: "Adds Level to Initiative"
      }
    end

    def self.wizard
      {
        can_cast_wizard_spells: "Wizard Spells",
        can_have_a_familiar: "Familiar",
        can_have_a_patron: "Patron"
      }
    end

    def self.kith
      {
        can_use_force_of_will: "Force of Will",
        can_find_outdoor_traps: "Find Outdoor Traps",
        can_detect_outdoor_foes: "Detect Foes (Outdoors)",
        can_track_outdoors: "Track (Outdoors)"
      }
    end

    ## Crawl #6
    def self.bard
      {
        has_bardic_luck: "Bardic Luck",
        can_cast_bard_spells: "Bard Spells",
        can_use_call_to_arms: "Call to Arms",
        can_use_challenge: "Challenge",
        can_use_calm: "Calm",
        can_use_lore: "Lore",
      }
    end

    def self.gnome
      {
        can_cast_gnome_spells: "Gnome Spells",
        can_use_trick_die: "Trick Die",
        has_magic_resistance: "Magic Resistance",
        can_use_animal_trick: "Animal Trick",
        has_gem_affinity: "Gem Affinity"
      }
    end

    def self.paladin
      {
        can_cast_divine_spells: "Divine Spells",
        can_use_smite: "Smite",
        can_cast_lay_on_hands_as_paladin: "Lay on Hands",
        can_instill_bravery: "Instill Bravery",
        can_cause_fear: "Cause Fear",
        can_have_fallen_points: "Fallen Points"
      }
    end

    def self.ranger
      {
        can_use_mighty_deeds_as_ranger: "Mighty Deeds",
        can_climb_as_ranger: "Climb",
        can_find_and_disable_natural_trap: "Find/Build/Disable Natural Traps",
        can_sneak_and_hide: "Sneak/Hide",
        can_stride: "Strider",
        knows_survival: "Survival",
        has_favored_enemies: "Favored Enemies"
      }
    end

    ## Crawl #10
    def self.dwarf_priest
      {
        can_cast_divine_spells: "Divine Spells",
        can_cast_turn_unholy: "Turn Unholy",
        can_cast_lay_on_hands: "Lay on Hands",
        can_cast_divine_aid: "Divine Aid",
        can_use_mighty_deeds_as_dwarf_priest: "Mighty Deeds",
        #applies_luck_to_armor_class: "Add Luck to AC" # TODO not implemented
      }
    end

    def self.elven_rogue
      {
        can_cast_wizard_spells: "Wizard Spells",
        can_have_a_familiar: "Familiar",
        can_have_a_patron: "Patron",
        can_find_trap: "Find Traps",
        can_disable_trap: "Disable Traps",
        can_pick_lock: "Pick Locks",
        can_sneak_silently: "Sneak Silently",
        can_hide_in_shadows: "Hide in Shadows",
        can_pick_pockets: "Pick Pockets",
        can_climb: "Climb",
        can_forge_document: "Forge Documents",
        can_handle_poison: "Handle Poison",
        can_read_languages: "Read Languages",
        can_backstab: "Backstab",
        can_disguise_self: "Disguise Self",
        has_lucky_skill: "Lucky Skill", # TODO fully implement
        has_heightened_senses: "Heightened Senses"
      }
    end

    def self.halfling_burglar
      {
        can_halfling_stealth: "Stealth",
        can_backstab: "Backstab",
        can_use_luck_die: "Luck Die",
        can_cast_spell_from_scroll: "Cast Spell from Scrolls",
        can_sneak_silently: "Sneak Silently",
        can_hide_in_shadows: "Hide in Shadows",
        can_pick_pockets: "Pick Pockets",
        can_climb: "Climb",
        can_pick_lock: "Pick Locks",
        can_find_trap: "Find Traps",
        can_disable_trap: "Disable Traps",
        can_forge_document: "Forge Documents",
        can_disguise_self: "Disguise Self",
        can_read_languages: "Read Languages",
        can_handle_poison: "Handle Poison"
      }
    end

    def self.halfling_champion
      {
        can_use_mighty_deeds: "Mighty Deeds",
        can_halfling_champion_stealth: "Stealth"
      }
    end

    ## Crawling Under a Broken Moon
    def self.cyborg
      {
        has_artifical_body_parts: "Artificial Body Parts",
        has_jury_rig_die: "Jury Rig Die",
        can_repair_tech: "Repair Tech",
        can_find_salvage: "Find Salvage"
      }
    end

    def self.mutant
      {
        has_survival_die: "Survival Die",
        has_mutations: "Mutations"
      }
    end

    def self.petrolhead
      {
        has_ace_die: "Ace Die",
        has_mojo_die: "Mojo Die"
      }
    end

    def self.technologist
      {
        can_tinker_with_weapons: "Weapon Tinkering",
        can_repair_bots: "Bot Repair",
        can_use_computers: "Computer Use",
        can_repair_vehicles: "Vehicle Repair",
        can_use_general_tech: "General Tech",
        can_use_alien_tech: "Alien Tech"
      }
    end
  end
end
