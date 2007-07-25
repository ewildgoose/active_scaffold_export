module ActiveScaffold
  module Helpers
    module ViewHelpers
      # Add the export plugin includes
      def active_scaffold_includes_with_export
        css = stylesheet_link_tag(ActiveScaffold::Config::Core.asset_path(:stylesheet, 'export-stylesheet.css'))
        ie_css = stylesheet_link_tag(ActiveScaffold::Config::Core.asset_path(:stylesheet, 'export-stylesheet-ie.css'))
        active_scaffold_includes_without_export + "\n" + css + "\n<!--[if IE]>" + ie_css + "<![endif]-->\n"
      end
      alias_method_chain :active_scaffold_includes, :export
    end
  end
end
