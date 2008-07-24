module ActiveScaffold
  module Helpers
    module ViewHelpers
      # Add the export plugin includes
      def active_scaffold_includes_with_export(frontend = :default)
        css = stylesheet_link_tag(ActiveScaffold::Config::Core.asset_path('export-stylesheet.css', frontend))
        ie_css = stylesheet_link_tag(ActiveScaffold::Config::Core.asset_path("export-stylesheet-ie.css", frontend))
        active_scaffold_includes_without_export + "\n" + css + "\n<!--[if IE]>" + ie_css + "<![endif]-->\n"
      end
      alias_method_chain :active_scaffold_includes, :export
    end
  end
end
