require 'erb'
require 'action_view'
require 'action_pack'
require 'action_controller'
require "dcc_tabbed_sheet/helpers"

module DccTabbedSheet
  class Compiler

    def self.perform
      options = {
        inline: File.read("views/DCC_Tabbed_Sheet.html.erb"),
        type: :erb,
        locals: {}
      }
      klass = Class.new(ActionView::Base) do
        include Helpers
      end
      view_paths = ["views"]
      details = {}
      prefixes = []
      lookup_context = ActionView::LookupContext.new(view_paths, details, prefixes)
      assigns = {}
      controller = nil
      output = klass.new(lookup_context, assigns, controller).render(options)
      File.write("build/DCC_Tabbed_Sheet.html", output)
    end

  end
end
