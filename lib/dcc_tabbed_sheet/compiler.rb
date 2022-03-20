require 'erb'
require 'fileutils'
require 'action_view'
require 'action_pack'
require 'action_controller'

Dir[File.join(__dir__, '..', '..', 'lib', '**', '*.rb')].each { |file| require file }

SRC_DIR = "views"
SRC_FILES = Dir[File.join(__dir__, '..', '..', SRC_DIR, '[^_]*.erb')]
BUILD_DIR = "build"

ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler.new)

module DccTabbedSheet
  class Compiler

    def self.perform
      SRC_FILES.each do |source_file|
        options = {
          inline: File.read(source_file),
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
        FileUtils.mkdir_p BUILD_DIR
        File.write(source_file.gsub(SRC_DIR, BUILD_DIR).gsub(/\.erb\z/, ''), output)
      end
    end

  end
end
