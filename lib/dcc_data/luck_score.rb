module DccData
  class LuckScore

    DATA_FILE_NAME = File.expand_path(File.join(__dir__, "./table_1-2_luck_score.yml"))

    Entry = Struct.new(:number, :birth_augur, :lucky_roll, :attr, :supported?, :note)

    def initialize
    end

    def entries
      @entries ||= YAML.load(File.read DATA_FILE_NAME).map{|row| Entry.new(*row) }
    end

  end
end
