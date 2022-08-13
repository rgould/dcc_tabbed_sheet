require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup
loader.eager_load

require "dcc_tabbed_sheet/compiler"
require "dcc_tabbed_sheet/version"

module DccTabbedSheet
  class Error < StandardError; end
end
