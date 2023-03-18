module DccData
  module Classes

    CORE_CLASSES=%w(cleric dwarf elf halfling thief warrior wizard)
    SUPPLEMENTAL_CLASSES=%w(kith)
    CRAWL_CLASSES=%w(bard dwarf_priest elven_rogue gnome halfling_burglar halfling_champion paladin ranger)
    CUABM_CLASSES=%w(cyborg mutant petrolhead technologist)

    ALL=CORE_CLASSES + SUPPLEMENTAL_CLASSES + CRAWL_CLASSES + CUABM_CLASSES
  end
end
