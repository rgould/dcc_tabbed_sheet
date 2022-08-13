module DccData
  class DataTable

    def initialize
    end

    def entries
      @entries ||= load_entries
    end

    protected

    def load_entries
      raw_data = YAML.load(File.read(data_file_name))

      headers = raw_data.shift

      struct_class = Struct.new(*headers.map(&:to_sym))

      raw_data.map{|row| struct_class.new(*row) }
    end

    def data_file_name
      File.expand_path(File.join(__dir__, self.class::FILE_NAME))
    end

  end
end
