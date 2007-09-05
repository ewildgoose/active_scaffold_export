module ActiveScaffold::Config
  class Core
    # configures where the active_scaffold_export plugin itself is located. there is no instance version of this.
    cattr_accessor :export_plugin_directory
    @@export_plugin_directory = File.expand_path(__FILE__).match(/vendor\/plugins\/([^\/]*)/)[1]

    # the active_scaffold_export template path
    def template_search_path_with_export(frontend = self.frontend)
      frontends_path = "../../vendor/plugins/#{ActiveScaffold::Config::Core.export_plugin_directory}/frontends"

      search_path = template_search_path_without_export
      search_path << "#{frontends_path}/#{frontend}/views" if frontend.to_sym != :default
      search_path << "#{frontends_path}/default/views"
      return search_path
    end

    cattr_accessor :export_show_form, :export_allow_full_download,
      :export_force_quotes, :export_default_full_download,
      :export_default_delimiter, :export_default_skip_header
    @@export_show_form = true
    @@export_allow_full_download = true
    @@export_default_full_download = true
    @@export_force_quotes = false
    @@export_default_skip_header = false
    @@export_default_delimiter = ','

    ActionController::Resources::Resource::ACTIVE_SCAFFOLD_ROUTING[:collection][:show_export] = :get

    alias_method_chain :template_search_path, :export
  end
end
